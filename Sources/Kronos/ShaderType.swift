//
//  ShaderType.swift
//  SwiftGL
//
//  Created by Alsey Coleman Miller on 1/22/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import OpenGLES
#endif

/// Specifies the type of shader.
public enum ShaderType: GLenum {
    
    /// A shader of type `GL_VERTEX_SHADER` is a shader that is intended to run on the programmable vertex processor
    case Vertex     = 0x8B31
    
    /// A shader of type `GL_FRAGMENT_SHADER` is a shader that is intended to run on the programmable fragment processor
    case Fragment   = 0x8B30
}