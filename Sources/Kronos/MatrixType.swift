//
//  MatrixType.swift
//  Kronos
//
//  Created by Alsey Coleman Miller on 1/24/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// OpenGL Matrix Type
public protocol MatrixType: MathType {
    
    /// The identity matrix.
    static var identity: Self { get }
}