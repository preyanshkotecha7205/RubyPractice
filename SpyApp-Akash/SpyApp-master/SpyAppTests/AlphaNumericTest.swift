//
//  AlphaNumTest.swift
//  SpyAppTests
//
//  Created by Akash Sheladiya on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class AlphaNumTest: XCTestCase {
    
    var cipher: AlphaNumericCesarCipher!
    
    override func setUp() {
        super.setUp()
        self.cipher = AlphaNumericCesarCipher()
    }
    
     func test_validationmessage () {
        let plaintext = "A6!"
        let result = cipher.encode (plaintext, secret: "1")
        XCTAssertEqual("Not a Valid Input.", result)
    }

    func test_negative() {
        let plaintext = "N2"
        let result = cipher.encode (plaintext, secret: "-1")
        XCTAssertEqual("M1", result)
    }
    
    func test_positive () {
        let plaintext = "X18"
        let result = cipher.encode (plaintext, secret: "1")
        XCTAssertEqual("Y29", result)
        
    }
    
    
    func test_SecretKeyValidation () {
        let plaintext = "MGK"
        let result = cipher.encode (plaintext, secret: "!")
        XCTAssertEqual("Enter a valid shift key",result)
    }
    
    
    
}
