//
//  ClearBufferMask.swift
//  Kronos
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import OpenGLES
#endif

/// Defines the values to use for specifying buffer clear masks.
public enum ClearBufferMask {
    
    case Color
    
    case Depth
    
    case Stencil
    
    /// Clear buffers to preset values.
    @inline(__always)
    public static func clear(mask: [ClearBufferMask]) {
        
        var glMask: GLbitfield = 0
        
        if mask.contains(.Color) {
            
            glMask |= GLbitfield(GL_COLOR_BUFFER_BIT)
        }
        
        if mask.contains(.Depth) {
            
            glMask |= GLbitfield(GL_DEPTH_BUFFER_BIT)
        }
        
        if mask.contains(.Stencil) {
            
            glMask |= GLbitfield(GL_STENCIL_BUFFER_BIT)
        }
        
        glClear(glMask)
    }
}