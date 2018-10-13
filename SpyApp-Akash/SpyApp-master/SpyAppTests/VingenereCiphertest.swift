//
//  SubCipherTest.swift
//  SpyAppTests
//
//  Created by Akash Sheladiya on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp


class SubCipherTest: XCTestCase {
    
    var cipher: VingenereCipher!
    
    override func setUp() {
        super.setUp()
        cipher = VingenereCipher()
    }
    
    
    
    func test_encode () {
        
        let plaintext = "abc"
        
        let result = cipher.encode(plaintext, secret: "rum")
        XCTAssertEqual("rum", result)
    }
    
    
    func test_decode () {
        
        let plaintext = "rum"
        
        let result = cipher.decode(plaintext, secret: "rum")
        XCTAssertEqual("abc", result)
    }
    
}

