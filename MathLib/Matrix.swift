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
    
    init(columns: [Vector]) {
        self.h = columns[0].content.count
        self.w = columns.count
        
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
    
    func inverse() -> Matrix {
        assert(self.w == self.h, "Matrix not a square")
        
        return Matrix(columns: [])
        
    }
    
    func transpose() -> Matrix {
        
        var columns: [Vector] = []
        
        for x in 0...self.h-1 {
            var row: [Double] = []
            for y in 0...self.w-1 {
                row.append(self.columns[y].content[x])
            }
            columns.append(Vector(n: row.count, content: row))
        }
        
        return Matrix(columns: columns)
        
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
        
        assert(a.h == b.w, "Matrix's not compatible with h: \(a.h) w: \(b.w)")
        
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
        
        
        let c = Matrix(columns: columns)
        
        return c
    }
    
    
    static func add(a: Matrix, b: Matrix) {
        
    }
    
}
