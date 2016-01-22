//
//  Program.swift
//  SwiftGL
//
//  Created by Alsey Coleman Miller on 1/20/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import OpenGLES
#endif

/// OpenGL Program
public struct Program {
    
    // MARK: - Properties
    
    public let name: GLuint
    
    // MARK: - Initialization
    
    /// Creates an empty program object.
    ///
    ///A program object is an object to which shader objects can be attached. This provides a mechanism to specify the shader objects that will be linked to create a program. It also provides a means for checking the compatibility of the shaders that will be used to create a program (for instance, checking the compatibility between a vertex shader and a fragment shader). When no longer needed as part of a program object, shader objects can be detached.
    @inline(__always)
    public init() {
        
        self.name = glCreateProgram()
        
        assert(self.name != 0, "Could not create program. ")
    }
}