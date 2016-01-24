//
//  Matrix4Tests.swift
//  Kronos
//
//  Created by Alsey Coleman Miller on 1/21/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import GLKit
#endif

import XCTest
import Kronos

final class Matrix4Tests: XCTestCase {
    
    func testSize() {
        
        XCTAssert(sizeof(Matrix4) == (sizeof(Float) * 16))
    }
    
    func testMultiply() {
        
        let matrix1 = Matrix4((1,0,1,0), (0.5,0,0.5, 0), (0.5,0.0 ,0.5, 0), (1,0,1,0))
        
        let matrix2 = Matrix4((0.5, 0, 0.5, 0), (1,0,1,0), (0.5,0.0 ,0.5, 0), (1,0,1,0))
        
        let result = matrix1 * matrix2
        
        let expectedResult = Matrix4((0.75, 0, 0.75, 0), (1.5, 0, 1.5, 0), (0.75, 0, 0.75, 0), (1.5, 0, 1.5, 0))
        
        #if os(iOS) || os(tvOS)
            
            do {
                
                let glkResult = GLKMatrix4Multiply(matrix1.toUIKit(), matrix2.toUIKit())
                
                XCTAssert(Matrix4(glkResult) == result)
            }
            
        #endif
        
        XCTAssert(result == expectedResult)
    }
}