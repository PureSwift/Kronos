//
//  Vector2.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// A representation of a 2-component vector.
public struct Vector2: OpenGLMathType {
    
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
        
        @inline(__always) get {
            
            switch index {
                
            case 0: return value.0
            case 1: return value.1
                
            default: fatalError("Invalid index \(index)")
            }
        }
        
        @inline(__always) set {
            
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

