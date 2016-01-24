//
//  Program.swift
//  Kronos
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
        
        assert(self.name != 0, "Could not create program. Error: \(OpenGLError.currentError)")
    }
    
    @inline(__always)
    public init(name: GLuint) {
        
        assert(name != 0)
        assert(glIsProgram(name).boolValue)
        
        self.name = name
    }
    
    // MARK: - Methods
    
    /// Installs a program object as part of current rendering state. 
    @inline(__always)
    static public func setCurrent(program: Program) {
        
        glUseProgram(program.name)
    }
    
    /// Attaches a shader to the program. 
    @inline(__always)
    public func attach(shader: Shader) {
        
        glAttachShader(name, shader.name)
    }
    
    /// Detaches a shader from the program.
    @inline(__always)
    public func detach(shader: Shader) {
        
        glDetachShader(name, shader.name)
    }
    
    /// Links the program object specified by program.
    ///
    /// Shader objects of type `GL_VERTEX_SHADER` attached to program are used to create an executable that will run on the programmable vertex processor. 
    /// Shader objects of type `GL_FRAGMENT_SHADER` attached to program are used to create an executable that will run on the programmable fragment processor.
    ///
    /// The status of the link operation will be stored as part of the program object's state. 
    /// This value will be set to `GL_TRUE` if the program object was linked without errors and is ready for use, and 
    /// `GL_FALSE` otherwise. It can be queried by calling glGetProgramiv with arguments program and `GL_LINK_STATUS`.
    @inline(__always)
    public func link() {
        
        glLinkProgram(name)
    }
    
    // MARK: - Accessors
    
    /// Get the link status of the program.
    public var linked: Bool {
        
        var linkStatus: GLint = 0
        
        glGetProgramiv(name, GLenum(GL_LINK_STATUS), &linkStatus)
        
        return (linkStatus != 0)
    }
    
    /// Gets the info log.
    public var log: String? {
        
        var logLength: GLint = 0
        
        glGetProgramiv(name, GLenum(GL_LINK_STATUS), &logLength)
        
        guard logLength > 0 else { return nil }
        
        let cString = UnsafeMutablePointer<CChar>.alloc(Int(logLength))
        defer { cString.dealloc(Int(logLength)) }
        
        glGetProgramInfoLog(name, GLsizei(logLength), nil, cString)
        
        return String.fromCString(cString)!
    }
}

