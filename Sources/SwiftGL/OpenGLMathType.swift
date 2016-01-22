//
//  OpenGLMathType.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/21/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

public protocol OpenGLMathType: Equatable {
    
    typealias PrimitiveValue
    
    var value: PrimitiveValue { get set }
}