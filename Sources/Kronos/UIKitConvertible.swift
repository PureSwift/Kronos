//
//  UIKitConvertible.swift
//  SwiftGL
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os (iOS) || os(tvOS)

import UIKit

/// Type that can be converted to and from Apple's ***UIKit*** equivalent types.
public protocol UIKitConvertible {
    
    typealias UIKitType
    
    /// Initializes the type from Apple's **UIKit** equivalent type.
    init(_ UIKit: UIKitType)
    
    /// Converts the type to an equivalent type for use with Apple's **UIKit**.
    func toUIKit() -> UIKitType
}

#endif
