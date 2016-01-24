//
//  Vector4.swift
//  Kronos
//
//  Created by Alsey Coleman Miller on 1/21/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import Darwin.C
#elseif os(Linux)
    import Glibc
#endif

/// A representation of a 4-component vector.
public struct Vector4: OpenGLVectorType {
    
    public typealias Scalar = Float
    
    // MARK: - Properties
    
    public var value: (Float, Float, Float, Float)
    
    // MARK: - Initialization
    
    @inline(__always)
    public init(_ x: Float, _ y: Float, _ z: Float, _ w: Float) {
        
        self.value = (x, y, z, w)
    }
}

// MARK: - Equatable

@inline(__always)
public func == (lhs: Vector4, rhs: Vector4) -> Bool {
    
    return lhs.value.0  == rhs.value.0
        && lhs.value.1  == rhs.value.1
        && lhs.value.2  == rhs.value.2
        && lhs.value.3  == rhs.value.3
}

@inline(__always)
public func == (lhs: Vector4, rhs: Float) -> Bool {
    
    return lhs.value.0  == rhs
        && lhs.value.1  == rhs
        && lhs.value.2  == rhs
        && lhs.value.3  == rhs
}

// MARK: - Comparable

@inline(__always)
public func < (lhs: Vector4, rhs: Vector4) -> Bool {
    
    return lhs.value.0  < rhs.value.0
        && lhs.value.1  < rhs.value.1
        && lhs.value.2  < rhs.value.2
        && lhs.value.3  < rhs.value.3
}

// MARK: - Math

/// Negate
@inline(__always)
public prefix func - (vector: Vector4) -> Vector4 {
    
    return Vector4( -vector.value.0, -vector.value.1, -vector.value.2, -vector.value.3)
}

/// Add
@inline(__always)
public func + (lhs: Vector4, rhs: Vector4) -> Vector4 {
    
    return Vector4(lhs.value.0 + rhs.value.0,
                   lhs.value.1 + rhs.value.1,
                   lhs.value.2 + rhs.value.2,
                   lhs.value.3 + rhs.value.3)
}

/// Subtract
@inline(__always)
public func - (lhs: Vector4, rhs: Vector4) -> Vector4 {
    
    return Vector4(lhs.value.0 - rhs.value.0,
                   lhs.value.1 - rhs.value.1,
                   lhs.value.2 - rhs.value.2,
                   lhs.value.3 - rhs.value.3)
}

/// Multiply
@inline(__always)
public func * (lhs: Vector4, rhs: Vector4) -> Vector4 {
    
    return Vector4(lhs.value.0 * rhs.value.0,
                   lhs.value.1 * rhs.value.1,
                   lhs.value.2 * rhs.value.2,
                   lhs.value.3 * rhs.value.3)
}

/// Divide
@inline(__always)
public func / (lhs: Vector4, rhs: Vector4) -> Vector4 {
    
    return Vector4(lhs.value.0 / rhs.value.0,
                   lhs.value.1 / rhs.value.1,
                   lhs.value.2 / rhs.value.2,
                   lhs.value.3 / rhs.value.3)
}

/// Add Scalar
@inline(__always)
public func + (lhs: Vector4, rhs: Float) -> Vector4 {
    
    return Vector4(lhs.value.0 + rhs,
                   lhs.value.1 + rhs,
                   lhs.value.2 + rhs,
                   lhs.value.3 + rhs)
}

/// Subtract Scalar
@inline(__always)
public func - (lhs: Vector4, rhs: Float) -> Vector4 {
    
    return Vector4(lhs.value.0 - rhs,
                   lhs.value.1 - rhs,
                   lhs.value.2 - rhs,
                   lhs.value.3 - rhs)
}

/// Multiply Scalar
@inline(__always)
public func * (lhs: Vector4, rhs: Float) -> Vector4 {
    
    return Vector4(lhs.value.0 * rhs,
                   lhs.value.1 * rhs,
                   lhs.value.2 * rhs,
                   lhs.value.3 * rhs)
}

/// Divide Scalar
@inline(__always)
public func / (lhs: Vector4, rhs: Float) -> Vector4 {
    
    return Vector4(lhs.value.0 / rhs, lhs.value.1 / rhs, lhs.value.2 / rhs, lhs.value.3 / rhs)
}

public extension Vector4 {
    
    @inline(__always)
    func maximum(rhs: Vector4) -> Vector4 {
        
        var max = self
        
        if rhs.value.0 > value.0 {
            max.value.0 = value.0
        }
        if rhs.value.1 > value.1 {
            max.value.1 = value.1
        }
        if rhs.value.2 > value.2 {
            max.value.2 = value.2
        }
        if rhs.value.3 > value.3 {
            max.value.3 = value.3
        }
        
        return max
    }
    
    @inline(__always)
    func minimum(rhs: Vector4) -> Vector4 {
        
        var min = self
        
        if rhs.value.0 < value.0 {
            min.value.0 = value.0
        }
        if rhs.value.1 < value.1 {
            min.value.1 = value.1
        }
        if rhs.value.2 < value.2 {
            min.value.2 = value.2
        }
        if rhs.value.3 < value.3 {
            min.value.3 = value.3
        }
        
        return min
    }
    
    @inline(__always)
    func normalize() -> Vector4 {
        
        let scale = Float(1.0) / self.length
        let vector = self * scale
        return vector
    }
    
    @inline(__always)
    func dotProduct(rhs: Vector4) -> Float {
        
        return value.0 * rhs.value.0 + value.1 * rhs.value.1 + value.2 * rhs.value.2 + value.3 * rhs.value.3
    }
    
    var length: Float {
        
        return sqrt(value.0 * value.0 + value.1 * value.1 + value.2 * value.2 + value.3 * value.3)
    }
}

