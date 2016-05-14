//
//  Buffer.swift
//  Kronos
//
//  Created by Alsey Coleman Miller on 1/22/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import OpenGLES
#endif

/// OpenGL Buffer
public struct Buffer {
    
    // MARK: - Properties
    
    public let name: GLuint
    
    // MARK: - Initialization
    
    /// Generate `count` number of buffers.
    public static func generate(_ count: Int) -> [Buffer] {
        
        assert(count > 0, "Invalid parameter 'count': \(count)")
        
        var bufferNames = [GLuint](repeating: 0, count: count)
        
        glGenBuffers(GLsizei(count), &bufferNames)
        
        return bufferNames.map { Buffer($0) }
    }
    
    /// Generate a single buffer
    @inline(__always)
    public init() {
        
        self = Buffer.generate(1).first!
    }
    
    /// Private direct initializer
    @inline(__always)
    private init(_ name: GLuint) {
        
        self.name = name
    }
    
    @inline(__always)
    public init(name: GLuint) {
        
        assert(name != 0)
        assert(glIsBuffer(name).boolValue)
        
        self.name = name
    }
    
    // MARK: - Methods
    
    @inline(__always)
    public static func delete(_ buffers: [Buffer]) {
        
        var bufferNames = buffers.map { $0.name }
        
        glDeleteBuffers(GLsizei(buffers.count), &bufferNames)
    }
    
    public func bind() {
        
        //glBindBuffer(GLenum(GL_ARRAY_BUFFER), name);
    }
    
    @inline(__always)
    public func delete() {
        
        Buffer.delete([self])
    }
}
