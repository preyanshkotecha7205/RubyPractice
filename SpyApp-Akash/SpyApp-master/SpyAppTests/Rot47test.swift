//
//  Rot47Test.swift
//  SpyAppTests
//
//  Created by Akash Sheladiya on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class Rot47Test: XCTestCase {
    
    var cipher:ROT47!
    
    override func setUp() {
        super.setUp()
        cipher = ROT47()
    }
    
    
    func test_encode () {
        
        let plaintext = "abc"
        
        let result = cipher.encode(plaintext, secret: "47")
        XCTAssertEqual("NOP", result)
    }
    
    
    func test_decode () {
        
        let plaintext = "nop"
        
        let result = cipher.decode(plaintext, secret: "47")
        XCTAssertEqual("ABC", result)
    }
    
    
    
    
}

