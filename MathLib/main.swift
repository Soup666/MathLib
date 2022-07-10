//
//  main.swift
//  MathLib
//
//  Created by Sam Laister on 10/07/2022.
//

import Foundation
import simd
import CoreLocation

print("Hello, World!")

//let af = simd_double2x2(rows: [
//    simd_double2( 2, 4),
//    simd_double2(-4, 2)
//    ])
//
//let bf = simd_double2(2, 14)
//
//
//let xf = simd_mul(af.inverse, bf)
//
//print(af.inverse)
//print(xf)
//
//let a = Matrix2x2(columns: [
//    Vector2(content: [2, 4]),
//    Vector2(content: [-4, 2])
//])
//
//let b = Vector2(content: [2, 14])
//
//
//let ad = a.inverse()
//ad.view()
//
//let ae = Matrix.dot_product(a: ad, b: b)
//
//print(ae.getContent())


let a = Matrix(columns: [
    Vector2(content: [2, 1]),
    Vector2(content: [3, 4]),
    Vector2(content: [5, 2])
])



a.view()


let d = a.transpose()
d.view()
