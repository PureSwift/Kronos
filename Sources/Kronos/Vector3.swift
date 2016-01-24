//
//  Vector3.swift
//  Kronos
//
//  Created by Alsey Coleman Miller on 1/20/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// A representation of a 3-component vector.
public struct Vector3: OpenGLMathType {
    
    // MARK: - Properties
    
    public var value: (Float, Float, Float)
    
    // MARK: - Initialization
    
    @inline(__always)
    public init(_ x: Float, _ y: Float, _ z: Float) {
        
        self.value = (x, y, z)
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
    
    public var z: Float {
        
        @inline(__always) get { return value.2 }
        @inline(__always) set { value.2 = newValue }
    }
    
    public var s: Float {
        
        @inline(__always) get { return value.0 }
        @inline(__always) set { value.0 = newValue }
    }
    
    public var t: Float {
        
        @inline(__always) get { return value.1 }
        @inline(__always) set { value.1 = newValue }
    }
    
    public var p: Float {
        
        @inline(__always) get { return value.2 }
        @inline(__always) set { value.2 = newValue }
    }
    
    // MARK: - Subscripting
    
    public subscript (index: Int) -> Float {
        
        get {
            
            switch index {
                
            case 0: return value.0
            case 1: return value.1
            case 2: return value.2
                
            default: fatalError("Invalid index \(index)")
            }
        }
        
        set {
            
            switch index {
                
            case 0: value.0 = newValue
            case 1: value.1 = newValue
            case 2: value.2 = newValue
                
            default: fatalError("Invalid index \(index)")
            }
        }
    }
}

// MARK: - Equatable

@inline(__always)
public func == (lhs: Vector3, rhs: Vector3) -> Bool {
    
    return lhs.value.0  == rhs.value.0
        && lhs.value.1  == rhs.value.1
        && lhs.value.2  == rhs.value.2
}

@inline(__always)
public func == (lhs: Vector3, rhs: Float) -> Bool {
    
    return lhs.value.0  == rhs
        && lhs.value.1  == rhs
        && lhs.value.2  == rhs
}

// MARK: - Comparable

@inline(__always)
public func < (lhs: Vector3, rhs: Vector3) -> Bool {
    
    return lhs.value.0  < rhs.value.0
        && lhs.value.1  < rhs.value.1
        && lhs.value.2  < rhs.value.2
}

@inline(__always)
public func < (lhs: Vector3, rhs: Float) -> Bool {
    
    return lhs.value.0  < rhs
        && lhs.value.1  < rhs
        && lhs.value.2  < rhs
}

// MARK: - Math

/// Negate
@inline(__always)
public prefix func - (vector: Vector3) -> Vector3 {
    
    return Vector3( -vector.value.0, -vector.value.1, -vector.value.2)
}

/// Add
@inline(__always)
public func + (lhs: Vector3, rhs: Vector3) -> Vector3 {
    
    return Vector3(lhs.value.0 + rhs.value.0,
        lhs.value.1 + rhs.value.1,
        lhs.value.2 + rhs.value.2)
}

/// Subtract
@inline(__always)
public func - (lhs: Vector3, rhs: Vector3) -> Vector3 {
    
    return Vector3(lhs.value.0 - rhs.value.0,
        lhs.value.1 - rhs.value.1,
        lhs.value.2 - rhs.value.2)
}

/// Multiply
@inline(__always)
public func * (lhs: Vector3, rhs: Vector3) -> Vector3 {
    
    return Vector3(lhs.value.0 * rhs.value.0,
        lhs.value.1 * rhs.value.1,
        lhs.value.2 * rhs.value.2)
}

/// Divide
@inline(__always)
public func / (lhs: Vector3, rhs: Vector3) -> Vector3 {
    
    return Vector3(lhs.value.0 / rhs.value.0,
        lhs.value.1 / rhs.value.1,
        lhs.value.2 / rhs.value.2)
}

/// Add Scalar
@inline(__always)
public func + (lhs: Vector3, rhs: Float) -> Vector3 {
    
    return Vector3(lhs.value.0 + rhs,
        lhs.value.1 + rhs,
        lhs.value.2 + rhs)
}

/// Subtract Scalar
@inline(__always)
public func - (lhs: Vector3, rhs: Float) -> Vector3 {
    
    return Vector3(lhs.value.0 - rhs,
        lhs.value.1 - rhs,
        lhs.value.2 - rhs)
}

/// Multiply Scalar
@inline(__always)
public func * (lhs: Vector3, rhs: Float) -> Vector3 {
    
    return Vector3(lhs.value.0 * rhs,
        lhs.value.1 * rhs,
        lhs.value.2 * rhs)
}

/// Divide Scalar
@inline(__always)
public func / (lhs: Vector3, rhs: Float) -> Vector3 {
    
    return Vector3(lhs.value.0 / rhs, lhs.value.1 / rhs, lhs.value.2 / rhs)
}

public extension Vector3 {
    
    @inline(__always)
    func maximum(rhs: Vector3) -> Vector3 {
        
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
        
        return max
    }
    
    @inline(__always)
    func minimum(rhs: Vector3) -> Vector3 {
        
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
        
        return min
    }
    
    @inline(__always)
    func normalize() -> Vector3 {
        
        let scale = Float(1.0) / self.length
        let vector = self * scale
        return vector
    }
    
    @inline(__always)
    func dotProduct(rhs: Vector3) -> Float {
        
        return value.0 * rhs.value.0 + value.1 * rhs.value.1 + value.2 * rhs.value.2
    }
    
    var length: Float {
        
        return sqrt(value.0 * value.0 + value.1 * value.1 + value.2 * value.2)
    }
    
    @inline(__always)
    func lerp(vectorEnd: Vector3, interpolation: Float) -> Vector3 {
        
        return Vector3(value.0 + ((vectorEnd.value.0 - value.0) * interpolation),
            value.1 + ((vectorEnd.value.1 - value.1) * interpolation),
            value.2 + ((vectorEnd.value.2 - value.2) * interpolation))
    }
    
    /// Performs a 3D cross product. 
    @inline(__always)
    func crossProduct(rhs: Vector3) -> Vector3 {
        
        return Vector3(value.1 * rhs.value.2 - value.2 * rhs.value.1,
            value.2 * rhs.value.0 - value.0 * rhs.value.2,
            value.0 * rhs.value.1 - value.1 * rhs.value.0)
    }
}

// MARK: - Darwin Support

#if os(iOS) || os(tvOS)
    
    import GLKit
    
    extension Vector3: UIKitConvertible {
        
        public init(_ GLKitValue: GLKVector3) {
            
            self.value = GLKitValue.v
        }
        
        public func toUIKit() -> GLKVector3 {
            
            return GLKVector3(v: self.value)
        }
    }
    
#endif
