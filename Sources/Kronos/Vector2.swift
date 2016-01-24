//
//  Vector2.swift
//  Kronos
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// A representation of a 2-component vector.
public struct Vector2: MathType {
    
    // MARK: - Properties
    
    public var value: (Float, Float)
    
    // MARK: - Initialization
    
    @inline(__always) 
    public init(_ x: Float, _ y: Float) {
        
        self.value = (x, y)
    }
    
    // MARK: - Accessors
    
    public var x: Float {
        
        @inline(__always) get { return value.0 }
        @inline(__always) set { value.0 = newValue }
    }
    
    public var y: Float {
        
        @inline(__always) get { return value.1 }
        @inline(__always) set { value.1 = newValue }
    }
    
    public var s: Float {
        
        @inline(__always) get { return value.0 }
        @inline(__always) set { value.0 = newValue }
    }
    
    public var t: Float {
        
        @inline(__always) get { return value.1 }
        @inline(__always) set { value.1 = newValue }
    }
    
    // MARK: - Subscripting
    
    public subscript (index: Int) -> Float {
        
        get {
            
            switch index {
                
            case 0: return value.0
            case 1: return value.1
                
            default: fatalError("Invalid index \(index)")
            }
        }
        
        set {
            
            switch index {
                
            case 0: value.0 = newValue
            case 1: value.1 = newValue
                
            default: fatalError("Invalid index \(index)")
            }
        }
    }
}

// MARK: - Equatable

@inline(__always)
public func ==(lhs: Vector2, rhs: Vector2) -> Bool {
    
    return lhs.value.0  == rhs.value.0
        && lhs.value.1  == rhs.value.1
}

@inline(__always)
public func == (lhs: Vector2, rhs: Float) -> Bool {
    
    return lhs.value.0  == rhs
        && lhs.value.1  == rhs
}

// MARK: - Comparable

@inline(__always)
public func < (lhs: Vector2, rhs: Vector2) -> Bool {
    
    return lhs.value.0  < rhs.value.0
        && lhs.value.1  < rhs.value.1
}

@inline(__always)
public func < (lhs: Vector2, rhs: Float) -> Bool {
    
    return lhs.value.0  < rhs
        && lhs.value.1  < rhs
}

// MARK: - Math

/// Negate
@inline(__always)
public prefix func - (vector: Vector2) -> Vector2 {
    
    return Vector2( -vector.value.0, -vector.value.1)
}

/// Add
@inline(__always)
public func + (lhs: Vector2, rhs: Vector2) -> Vector2 {
    
    return Vector2(lhs.value.0 + rhs.value.0, lhs.value.1 + rhs.value.1)
}

/// Subtract
@inline(__always)
public func - (lhs: Vector2, rhs: Vector2) -> Vector2 {
    
    return Vector2(lhs.value.0 - rhs.value.0, lhs.value.1 - rhs.value.1)
}

/// Multiply
@inline(__always)
public func * (lhs: Vector2, rhs: Vector2) -> Vector2 {
    
    return Vector2(lhs.value.0 * rhs.value.0, lhs.value.1 * rhs.value.1)
}

/// Divide
@inline(__always)
public func / (lhs: Vector2, rhs: Vector2) -> Vector2 {
    
    return Vector2(lhs.value.0 / rhs.value.0, lhs.value.1 / rhs.value.1)
}

/// Add Scalar
@inline(__always)
public func + (lhs: Vector2, rhs: Float) -> Vector2 {
    
    return Vector2(lhs.value.0 + rhs, lhs.value.1 + rhs)
}

/// Subtract Scalar
@inline(__always)
public func - (lhs: Vector2, rhs: Float) -> Vector2 {
    
    return Vector2(lhs.value.0 - rhs, lhs.value.1 - rhs)
}

/// Multiply Scalar
@inline(__always)
public func * (lhs: Vector2, rhs: Float) -> Vector2 {
    
    return Vector2(lhs.value.0 * rhs, lhs.value.1 * rhs)
}

/// Divide Scalar
@inline(__always)
public func / (lhs: Vector2, rhs: Float) -> Vector2 {
    
    return Vector2(lhs.value.0 / rhs, lhs.value.1 / rhs)
}

public extension Vector2 {
    
    @inline(__always)
    func maximum(rhs: Vector2) -> Vector2 {
        
        var max = self
        
        if rhs.value.0 > value.0 {
            max.value.0 = value.0
        }
        if rhs.value.1 > value.1 {
            max.value.1 = value.1
        }
        
        return max
    }
    
    @inline(__always)
    func minimum(rhs: Vector2) -> Vector2 {
        
        var min = self
        
        if rhs.value.0 < value.0 {
            min.value.0 = value.0
        }
        if rhs.value.1 < value.1 {
            min.value.1 = value.1
        }
        
        return min
    }
    
    @inline(__always)
    func normalize() -> Vector2 {
        
        let scale = Float(1.0) / self.length
        let vector = self * scale
        return vector
    }
    
    @inline(__always)
    func dotProduct(rhs: Vector2) -> Float {
        
        return value.0 * rhs.value.0 + value.1 * rhs.value.1
    }
    
    var length: Float {
        
        return sqrt(value.0 * value.0 + value.1 * value.1)
    }
    
    @inline(__always)
    func lerp(vectorEnd: Vector2, interpolation: Float) -> Vector2 {
        
        return Vector2(value.0 + ((vectorEnd.value.0 - value.0) * interpolation),
            value.1 + ((vectorEnd.value.1 - value.1) * interpolation))
    }
}

// MARK: - Darwin Support

#if os(iOS) || os(tvOS)
    
    import GLKit
    
    extension Vector2: UIKitConvertible {
        
        public init(_ GLKitValue: GLKVector2) {
            
            self.value = GLKitValue.v
        }
        
        public func toUIKit() -> GLKVector2 {
            
            return GLKVector2(v: self.value)
        }
    }
    
#endif

