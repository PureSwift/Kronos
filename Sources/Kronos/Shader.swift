//
//  Shader.swift
//  SwiftGL
//
//  Created by Alsey Coleman Miller on 1/22/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import OpenGLES
#endif

/// OpenGL Shader
///
/// - Note: Like texture objects, the name space for shader objects may be shared across a set of contexts, 
/// as long as the server sides of the contexts share the same address space. 
/// If the name space is shared across contexts, any attached objects and the data associated with those 
/// attached objects are shared as well.
///
/// Applications are responsible for providing the synchronization across API calls when objects 
/// are accessed from different execution threads.
public struct Shader {
    
    // MARK: - Properties
    
    public let name: GLuint
    
    // MARK: - Initialization
    
    /// Creates an empty shader object and returns a non-zero value by which it can be referenced. 
    ///
    /// A shader object is used to maintain the source code strings that define a shader.
    /// - Parameter type: Indicates the type of shader to be created.
    @inline(__always)
    public init(type: ShaderType) {
        
        self.name = glCreateShader(type.rawValue)
        
        // This function returns 0 if an error occurs creating the shader object.
        // GL_INVALID_ENUM is generated if shaderType is not an accepted value.
        assert(self.name != 0, "Could not create \(type) Shader")
    }
    
    @inline(__always)
    public init(name: GLuint) {
        
        assert(name != 0)
        assert(glIsShader(name).boolValue)
        
        self.name = name
    }
    
    // MARK: - Methods
    
    @inline(__always)
    public func compile() {
        
        glCompileShader(name)
    }
    
    /// Frees the memory and invalidates the name associated with the shader object specified. 
    ///
    /// If a shader object to be deleted is attached to a program object, it will be flagged for deletion, 
    /// but it will not be deleted until it is no longer attached to any program object, for any rendering context 
    /// (i.e., it must be detached from wherever it was attached before it will be deleted).
    @inline(__always)
    public func delete() {
        
        glDeleteShader(name)
    }
    
    /// Replaces the source code in a shader object.
    ///
    /// Sets the source code in shader to the source code in the array of strings specified by `source`.
    /// Any source code previously stored in the shader object is completely replaced. 
    /// The number of strings in the array is specified by count. If length is NULL, each string is assumed to be null terminated. If length is a value other than NULL, it points to an array containing a string length for each of the corresponding elements of string. Each element in the length array may contain the length of the corresponding string (the null character is not counted as part of the string length) or a value less than 0 to indicate that the string is null terminated. The source code strings are not scanned or parsed at this time; they are simply copied into the specified shader object.
    public func setSource(source: [String]) {
        
        let cStringPointers = UnsafeMutablePointer<UnsafeMutablePointer<CChar>>.alloc(source.count)
        defer { cStringPointers.dealloc(source.count) }
        
        for string in source {
            
            let stringPointer = UnsafeMutablePointer<CChar>.alloc(string.utf8.count)
            defer { stringPointer.dealloc(string.utf8.count) }
            
            string.withCString { (charPointer) in
                
                memcpy(stringPointer, charPointer, source.count - 1)
            }
        }
        
        let pointer = UnsafePointer<UnsafePointer<CChar>>(cStringPointers)
        
        glShaderSource(name, GLsizei(source.count), pointer, nil)
    }
    
    // MARK: - Accessors
    
    /// Get the compile status of the shader.
    public var compiled: Bool {
        
        var status: GLint = 0
        
        glGetShaderiv(name, GLenum(GL_COMPILE_STATUS), &status)
        
        return (status != 0)
    }
}

