//
//  Capability.swift
//  SwiftGL
//
//  Created by Alsey Coleman Miller on 1/21/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import OpenGLES
#endif

/// OpenGL server-side Capabilities. Can be enabled or disabled.
///
/// - Note: All cases, with the exception of `Dither`, are false by default.
public enum Capability: GLenum {
    
    case Texture2D              = 0x0DE1
    
    /// If enabled, cull polygons based on their winding in window coordinates.
    case CullFace               = 0x0B44
    
    /// If enabled, blend the computed fragment color values with the values in the color buffers.
    case Blend                  = 0x0BE2
    
    /// If enabled, dither color components or indices before they are written to the color buffer.
    case Dither                 = 0x0BD0
    
    /// If enabled, do stencil testing and update the stencil buffer.
    case StencilTest            = 0x0B90
    
    /// If enabled, do depth comparisons and update the depth buffer. 
    ///
    /// - Note: Even if the depth buffer exists and the depth mask is non-zero, 
    /// the depth buffer is not updated if the depth test is disabled.
    case DepthTest              = 0x0B71
    
    /// If enabled, discard fragments that are outside the scissor rectangle.
    case ScissorTest            = 0x0C11
    
    /// If enabled, an offset is added to depth values of a polygon's fragments produced by rasterization.
    case PloygonOffsetFill      = 0x8037
    
    /// If enabled, compute a temporary coverage value where each bit is determined by the alpha value at 
    /// the corresponding sample location. The temporary coverage value is then ANDed with the fragment coverage value.
    case SampleAlphaToCoverage  = 0x809E
    
    /// If enabled, the fragment's coverage is ANDed with the temporary coverage value. 
    /// If `GL_SAMPLE_COVERAGE_INVERT` is set to `GL_TRUE`, invert the coverage value.
    case SampleCoverage         = 0x80A0
    
    public var enabled: Bool {
        
        @inline(__always) get { return glIsEnabled(rawValue).boolValue }
        
        @inline(__always) set { newValue ? glEnable(rawValue) : glDisable(rawValue) }
    }
}

