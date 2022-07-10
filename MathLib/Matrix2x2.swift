//
//  Matrix2x2.swift
//  MathLib
//
//  Created by Sam Laister on 10/07/2022.
//

import Foundation

class Matrix2x2: Matrix {
    
    
    init(columns: [Vector2]) {
        
        super.init(width: 2, height: 2, columns: columns)
    }
    
    func inverse() -> Matrix {
        
        // Swap A and D
        let tmp = self.columns[1].content[1]
        self.columns[1].content[1] = self.columns[0].content[0]
        self.columns[0].content[0] = tmp
        
        // Invert B and C
        self.columns[1].content[0] = 0 - self.columns[1].content[0]
        self.columns[0].content[1] = 0 - self.columns[0].content[1]
        
        // Determinant
        let determinant = 1 / ((self.columns[0].content[0] * self.columns[1].content[1]) - (self.columns[0].content[1] * self.columns[1].content[0]))
        
        for col in self.columns {
            col.map(a: determinant, operation: self.determinant)
        }
        
        return self
    }
    
    func determinant(a: Double, b: Double) -> Double {
        return a * b
    }
    
}
