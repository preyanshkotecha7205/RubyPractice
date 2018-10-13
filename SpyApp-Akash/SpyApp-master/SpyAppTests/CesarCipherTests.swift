//
//  CesarCipherTests.swift
//  SpyAppTests
//
//  Created by Akash Sheladiya on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class CesarCipherTests: XCTestCase {
    
    var cipher: CeaserCipher!
    
    override func setUp() {
        super.setUp()
        cipher = CeaserCipher()
    }
    
    func test_zero() {
    let plaintext = "A"
    let result = cipher.encode(plaintext, secret: "0")
    XCTAssertEqual(plaintext, result)
        
    }
    
    func test_negative() {
        let plaintext = "B"
        let result = cipher.encode (plaintext, secret: "-1")
        XCTAssertEqual("X", result)
    }
    
    func test_positive () {
        let plaintext = "X"
        let result = cipher.encode (plaintext, secret: "1")
        XCTAssertEqual("B", result)

    }
    
    func test_messagevalidation () {
         let plaintext = "R!!"
        let result = cipher.encode (plaintext, secret: "1")
        XCTAssertEqual("Only alphabets allowed for encrpytion!", result)
    }
    
    func test_isSecretKeyToEncryptValid () {
        let plaintext = "hello"
        let result = cipher.encode (plaintext, secret: "!")
        XCTAssertEqual("Not a Valid Input.",result)
    }
    
    func test_messageAlphabet () {
        let plaintext1 = "jkl"
        let plaintext2 = "Emimen"
        let result1 = cipher.isOnlyAlpha(plaintext1)
        let result2 = cipher.isOnlyAlpha(plaintext2)
        XCTAssertEqual(true,result1)
        XCTAssertEqual(false,result2) 

        
    }
    
    
}
