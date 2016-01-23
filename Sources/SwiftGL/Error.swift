//
//  OpenGLError.swift
//  SwiftGL
//
//  Created by Alsey Coleman Miller on 1/21/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import OpenGLES
#endif

/// OpenGL Errors
public enum OpenGLError: GLenum, ErrorType {
    
    case InvalidEnum                    = 0x0500
    
    case InvalidValue                   = 0x0501
    
    case InvalidOperation               = 0x0502
    
    #if os(OSX)
    
    case StackOverflow                  = 0x0503
    
    case StackUnderflow                 = 0x0504
    
    #endif
    
    case OutOfMemory                    = 0x0505
    
    case InvalidFramebufferOperation    = 0x0506
    
    public static var currentError: OpenGLError? {
        
        let rawValue = glGetError()
        
        guard rawValue != 0 else { return nil }
        
        guard let error = OpenGLError(rawValue: rawValue)
            else { fatalError("Invalid, non-zero OpenGL error: \(rawValue)") }
        
        return error
    }
    
    public static func throwError() throws {
        
        guard let error = OpenGLError.currentError else { return }
        
        throw error
    }
}