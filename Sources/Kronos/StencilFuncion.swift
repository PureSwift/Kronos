//
//  StencilFuncion.swift
//  SwiftGL
//
//  Created by Alsey Coleman Miller on 1/23/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import OpenGLES
#endif

public enum StencilFunction: GLenum {
    
    case Never              = 0x0200
    case Less               = 0x0201
    case Equal              = 0x0202
    case LessThanOrEqual    = 0x0203
    case Greater            = 0x0204
    case NotEqual           = 0x0205
    case GreaterThanOrEqual = 0x0206
    case Always             = 0x0207
}