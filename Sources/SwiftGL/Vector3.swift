//
//  Vector3.swift
//  Swallow
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
        
        @inline(__always) get {
            
            switch index {
                
            case 0: return value.0
            case 1: return value.1
            case 2: return value.2
                
            default: fatalError("Invalid index \(index)")
            }
        }
        
        @inline(__always) set {
            
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
public func ==(lhs: Vector3, rhs: Vector3) -> Bool {
    
    return lhs.value.0  == rhs.value.0
        && lhs.value.1  == rhs.value.1
        && lhs.value.2  == rhs.value.2
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
