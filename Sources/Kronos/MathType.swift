//
//  MathType.swift
//  Kronos
//
//  Created by Alsey Coleman Miller on 1/21/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// OpenGL Math type
public protocol MathType: Equatable {
    
    /// The tuple type. (e.g. `(Float, Float)`)
    associatedtype ScalarTuple
    
    /// The tuple value of the OpenGL Math type.
    var value: ScalarTuple { get set }
    
    /// Add
    ///
    /// - Returns: A new vector whose components each represent the sum of the two components found in the 
    /// same positions of the two source vectors.
    func + (lhs: Self, rhs: Self) -> Self
    
    /// Subtract
    ///
    /// - Returns: A new vector whose components each represent the sum of the two components found in the
    /// same positions of the two source vectors.
    func - (lhs: Self, rhs: Self) -> Self
    
    /// Multiply
    ///
    /// - Returns: A new vector whose components each represent the product of the components 
    /// found in the same positions of the two source vectors.
    func * (lhs: Self, rhs: Self) -> Self
}