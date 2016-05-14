//
//  VectorType.swift
//  Kronos
//
//  Created by Alsey Coleman Miller on 1/24/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// OpenGL Vector Type
public protocol VectorType: MathType, Comparable {
    
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
    func maximum(_ rhs: Self) -> Self
    
    /// Returns a new vector whose component value at each position is the smallest component value
    /// at the same position in the source vectors.
    func minimum(_ rhs: Self) -> Self
    
    /// Returns a new vector created by normalizing an input vector to a length of 1.0.
    func normalize() -> Self
    
    /// Returns the dot product of two vectors.
    func dotProduct(_ rhs: Self) -> Float
    
    /// Returns the length of a vector.
    var length: Float { get }
    
    /// Returns the distance between two points.
    func distance(_ vectorEnd: Self) -> Float
    
    /// Returns a new vector created by linearly interpreting between two vectors.
    func lerp(_ vectorEnd: Self, interpolation: Float) -> Self
    
    /// Project the vector onto the vector, `projectionVector`.
    func project(_ projectionVector: Self) -> Self
}

// MARK: - Protocol Extensions

public extension VectorType {
    
    @inline(__always)
    func normalize() -> Self {
        
        let scale = Float(1.0) / self.length
        let vector = self * scale
        return vector
    }
    
    @inline(__always)
    func distance(_ vectorEnd: Self) -> Float {
        
        return (vectorEnd - self).length
    }
    
    @inline(__always)
    func project(_ projectionVector: Self) -> Self {
        
        let scale = projectionVector.dotProduct(self) / projectionVector.dotProduct(projectionVector)
        
        return projectionVector * scale
    }
}


