//
//  Vector.swift
//  MathLib
//
//  Created by Sam Laister on 10/07/2022.
//

import Foundation

class Vector {
    
    var n: Int
    var content: [Double]
    
    init(n: Int, content: [Double]) {
        self.content = content
        self.n = n
    }
    
    func getContent() -> [Double] {
        return self.content
    }
    
    func map(a: Double, operation: (Double, Double) -> Double) {
        for x in 0...n-1 {
            self.content[x] = operation(a, self.content[x])
        }
    }
    
    func getLength() -> Int {
        return self.n
    }
}
