//
//  Matrix.swift
//  MathLib
//
//  Created by Sam Laister on 10/07/2022.
//

import Foundation

class Matrix {
    
    var n: Int {
        
        get {
            return self.h*self.w
        }
    }
    
    var columns: [Vector]
    
    var w: Int
    var h: Int
    
    init(width: Int, height: Int, columns: [Vector]) {
        self.w = width
        self.h = height
        
        self.columns = columns
    }
    
    func flat() -> Int {
        return n
    }
    
    func view() {
        
        var output = ""
        
        for x in 0...self.h-1 {
            for y in 0...self.w-1 {
                output += "\(self.columns[y].getContent()[x]) "
            }
            output += "\n"
        }
        
        print(output)
        
    }
    
    
    static func createIdentity() -> Matrix4x4 {
        return Matrix4x4(columns: [
            Vector4(content: [1,0,0,0]),
            Vector4(content: [0,1,0,0]),
            Vector4(content: [0,0,1,0]),
            Vector4(content: [0,0,0,1])
        ])
    }
    
    static func dot_product(a: Matrix, b: Vector) -> Vector {
        let w = a.h
        let h = a.w
        
        let c = Vector2(content: [])
        
        for i in 0...w-1 {
            var t = 0.0
            for j in 0...h-1 {
                t += a.columns[i].content[j] * b.content[j]
            }
            c.content.append(t)
        }
        
        return c
    }
    
    
    static func dot_product(a: Matrix, b: Matrix) -> Matrix {
        // B*A
        
        let w = a.w
        let h = a.h
        
        var columns: [Vector] = []
        
        for i in 0...w-1 {
            var col: [Double] = []
            for j in 0...w-1 {
                var t = 0.0
                for k in 0...h-1 {
                    t += a.columns[i].content[k] * b.columns[k].content[j]
//                    print("\(a.columns[i].content[k]) * \(b.columns[k].content[i])")
                }
                col.append(t)
            }
            columns.append(Vector(n: w, content: col))
        }
        
        
        let c = Matrix(width: w, height: w, columns: columns)
        
        return c
    }
    
}
