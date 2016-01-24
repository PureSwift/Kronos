//
//  OpenGLVectorType.swift
//  Kronos
//
//  Created by Alsey Coleman Miller on 1/24/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// OpenGL Vector Type
public protocol OpenGLVectorType: OpenGLMathType, Comparable {
    
    /// Divide
    ///
    /// - Returns: A new vector whose components are each calculated by dividing the component found in 
    /// same position of the first vector by the component found in the same position of the second vector.
    func / (lhs: Self, rhs: Self) -> Self
    
    /// Multiply by scalar
    func * (lhs: Self, rhs: Float) -> Self
    
    /// Equal to Scalar
    ///
    /// - Returns: Returns a Boolean value that states whether all the components of the source vector 
    /// are equal to a scalar value.
    func == (lhs: Self, rhs: Float) -> Bool
    
    /// Less than Scalar
    ///
    /// - Returns: Returns a Boolean value that states whether all the components of the source vector
    /// are equal to a scalar value.
    func < (lhs: Self, rhs: Float) -> Bool
    
    /// Negate
    ///
    /// - Returns: Returns a new vector created by negating the component values of another vector.
    prefix func - (vector: Self) -> Self
    
    /// Returns a new vector whose component value at each position is the largest component value
    /// at the same position in the source vectors.
    func maximum(lhs: Self) -> Self
    
    /// Returns a new vector whose component value at each position is the smallest component value
    /// at the same position in the source vectors.
    func minimum(rhs: Self) -> Self
    
    /// Returns a new vector created by normalizing an input vector to a length of 1.0.
    func normalize() -> Self
    
    /// Returns the dot product of two vectors.
    func dotProduct(rhs: Self) -> Float
    
    /// Returns the length of a vector.
    var length: Float { get }
    
    /// Returns the distance between two points.
    func distance(vectorEnd: Self) -> Float
    
    /// Returns a new vector created by linearly interpreting between two vectors.
    func lerp(vectorEnd: Self, interpolation: Float) -> Self
    
    /// Performs a 3D cross product. The last component of the resulting cross product will be zeroed out.
    func crossProduct(rhs: Self) -> Self
    
    /// Project the vector onto the vector, `projectionVector`.
    func project(projectionVector: Self) -> Self
}

// MARK: - Protocol Extensions

public extension OpenGLVectorType {
    
    @inline(__always)
    func normalize() -> Self {
        
        let scale = Float(1.0) / self.length
        let vector = self * scale
        return vector
    }
    
    @inline(__always)
    func distance(vectorEnd: Self) -> Float {
        
        return (vectorEnd - self).length
    }
}


