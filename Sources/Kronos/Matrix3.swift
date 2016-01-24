//
//  Matrix3.swift
//  Kronos
//
//  Created by Alsey Coleman Miller on 1/20/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// A 3x3 matrix stored in column-major order.
public struct Matrix3: MatrixType {
    
    // MARK: - Value
    
    public var value: (Float, Float, Float, Float, Float, Float, Float, Float, Float)
    
    // MARK: - Initialization
    
    @inline(__always)
    public init(_ m0: (Float, Float, Float),
                _ m1: (Float, Float, Float),
                _ m2: (Float, Float, Float))
    {
        self.value = (m0.0, m0.1, m0.2,
                      m1.0, m1.1, m1.2,
                      m2.0, m2.1, m2.2)
    }
    
    @inline(__always)
    public init() {
        
        self.value = (0,0,0,0,0,0,0,0,0)
    }
    
    public static let identity = Matrix3((1,0,0),
                                         (0,1,0),
                                         (0,0,1))
    
    // MARK: - Accessors
    
    public var m00: Float {
        
        @inline(__always) get { return value.0 }
        @inline(__always) set { value.0 = newValue }
    }
    
    public var m01: Float {
        
        @inline(__always) get { return value.1 }
        @inline(__always) set { value.1 = newValue }
    }
    
    public var m02: Float {
        
        @inline(__always) get { return value.2 }
        @inline(__always) set { value.2 = newValue }
    }
    
    public var m10: Float {
        
        @inline(__always) get { return value.3 }
        @inline(__always) set { value.3 = newValue }
    }
    
    public var m11: Float {
        
        @inline(__always) get { return value.4 }
        @inline(__always) set { value.4 = newValue }
    }
    
    public var m12: Float {
        
        @inline(__always) get { return value.5 }
        @inline(__always) set { value.5 = newValue }
    }
    
    public var m20: Float {
        
        @inline(__always) get { return value.6 }
        @inline(__always) set { value.6 = newValue }
    }
    
    public var m21: Float {
        
        @inline(__always) get { return value.7 }
        @inline(__always) set { value.7 = newValue }
    }
    
    public var m22: Float {
        
        @inline(__always) get { return value.8 }
        @inline(__always) set { value.8 = newValue }
    }
    
    // MARK: - Subscripting
    
    public subscript (index: Int) -> Float {
        
        get {
            
            switch index {
                
            case 0: return value.0
            case 1: return value.1
            case 2: return value.2
            case 3: return value.3
            case 4: return value.4
            case 5: return value.5
            case 6: return value.6
            case 7: return value.7
            case 8: return value.8
                
            default: fatalError("Invalid index \(index)")
            }
        }
        
        set {
            
            switch index {
                
            case 0: value.0 = newValue
            case 1: value.1 = newValue
            case 2: value.2 = newValue
            case 3: value.3 = newValue
            case 4: value.4 = newValue
            case 5: value.5 = newValue
            case 6: value.6 = newValue
            case 7: value.7 = newValue
            case 8: value.8 = newValue
                
            default: fatalError("Invalid index \(index)")
            }
        }
    }
}

// MARK: - Equatable

@inline(__always)
public func == (lhs: Matrix3, rhs: Matrix3) -> Bool {
    
    return lhs.value.0  == rhs.value.0
        && lhs.value.1  == rhs.value.1
        && lhs.value.2  == rhs.value.2
        && lhs.value.3  == rhs.value.3
        && lhs.value.4  == rhs.value.4
        && lhs.value.5  == rhs.value.5
        && lhs.value.6  == rhs.value.6
        && lhs.value.7  == rhs.value.7
        && lhs.value.8  == rhs.value.8
}

// MARK: - Math

@inline(__always)
public func + (lhs: Matrix3, rhs: Matrix3) -> Matrix3 {
    
    var m = Matrix3()
    
    m.value.0 = lhs.value.0 - rhs.value.0
    m.value.1 = lhs.value.1 - rhs.value.1
    m.value.2 = lhs.value.2 - rhs.value.2
    
    m.value.3 = lhs.value.3 - rhs.value.3
    m.value.4 = lhs.value.4 - rhs.value.4
    m.value.5 = lhs.value.5 - rhs.value.5
    
    m.value.6 = lhs.value.6 - rhs.value.6
    m.value.7 = lhs.value.7 - rhs.value.7
    m.value.8 = lhs.value.8 - rhs.value.8
    
    return m;
}

@inline(__always)
public func - (lhs: Matrix3, rhs: Matrix3) -> Matrix3 {
    
    var m = Matrix3()
    
    m.value.0 = lhs.value.0 + rhs.value.0
    m.value.1 = lhs.value.1 + rhs.value.1
    m.value.2 = lhs.value.2 + rhs.value.2
    
    m.value.3 = lhs.value.3 + rhs.value.3
    m.value.4 = lhs.value.4 + rhs.value.4
    m.value.5 = lhs.value.5 + rhs.value.5
    
    m.value.6 = lhs.value.6 + rhs.value.6
    m.value.7 = lhs.value.7 + rhs.value.7
    m.value.8 = lhs.value.8 + rhs.value.8
    
    return m
}

/// Multiply
@inline(__always)
public func * (lhs: Matrix3, rhs: Matrix3) -> Matrix3 {
    
    var m = Matrix3()
    
    m.value.0 = lhs.value.0 *  rhs.value.0 + lhs.value.3 *  rhs.value.1 + lhs.value.6 *  rhs.value.2
    m.value.3 = lhs.value.0 *  rhs.value.3 + lhs.value.3 *  rhs.value.4 + lhs.value.6 *  rhs.value.5
    m.value.6 = lhs.value.0 *  rhs.value.6 + lhs.value.3 *  rhs.value.7 + lhs.value.6 *  rhs.value.8
    
    m.value.1 = lhs.value.1 *  rhs.value.0 + lhs.value.4 *  rhs.value.1 + lhs.value.7 *  rhs.value.2
    m.value.4 = lhs.value.1 *  rhs.value.3 + lhs.value.4 *  rhs.value.4 + lhs.value.7 *  rhs.value.5
    m.value.7 = lhs.value.1 *  rhs.value.6 + lhs.value.4 *  rhs.value.7 + lhs.value.7 *  rhs.value.8
    
    m.value.2 = lhs.value.2 *  rhs.value.0 + lhs.value.5 *  rhs.value.1 + lhs.value.8 *  rhs.value.2
    m.value.5 = lhs.value.2 *  rhs.value.3 + lhs.value.5 *  rhs.value.4 + lhs.value.8 *  rhs.value.5
    m.value.8 = lhs.value.2 *  rhs.value.6 + lhs.value.5 *  rhs.value.7 + lhs.value.8 *  rhs.value.8
    
    return m
}

// MARK: - Darwin Support

#if os(iOS) || os(tvOS)
    
    import GLKit
    
    extension Matrix3: UIKitConvertible {
        
        public init(_ GLKitValue: GLKMatrix3) {
            
            self.value = GLKitValue.m
        }
        
        public func toUIKit() -> GLKMatrix3 {
            
            return GLKMatrix3(m: self.value)
        }
    }
    
#endif

