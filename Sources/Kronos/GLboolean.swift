//
//  GLboolean.swift
//  Kronos
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import OpenGLES
#endif

extension GLboolean: Boolean {
    
    public var boolValue: Bool {
        
        return Bool(self)
    }
}