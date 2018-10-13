//
//  VigenereCipher.swift
//  SpyApp
//
//  Created by Akash Sheladiya on 9/13/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//
import Foundation



struct VigenereCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String {
        
        var word = plaintext
        
        var startAt: UInt32 = 97
        
        if  (!Alphatesting(plaintext)) {
            
            return "Not a valid key."
        }
        
        if  (!Alphatesting(secret)) {
            
            return "Not a valid secret value."
        }
        
        if secret.count > 26 {
            
            return "Value of secret needs to be inside the range of Alphabets. "
        }
        
       
        
    
        
        for character in secret {
            let toReplace = String (character)
            word = word.replacingOccurrences(of: String(UnicodeScalar(UInt8(startAt))), with: toReplace, options: NSString.CompareOptions.literal, range: nil)
            
            startAt = startAt + 1
        }
        return word
    }
    
    func decode(_ plaintext: String, secret: String) -> String {
        
        var word = plaintext
        var startAt: UInt32 = 97
        
        
        if  (!Alphatesting(plaintext)) {
            
            return "Not a valid key."
        }
        
        if  (!Alphatesting(secret)) {
            
            return "Not a valid secret value."
        }
        
        for character in secret {
            let toReplace = String (character)
            word = word.replacingOccurrences(of: toReplace, with: String(UnicodeScalar(UInt8(startAt))), options: NSString.CompareOptions.literal, range: nil)
            startAt = startAt + 1
        }
        return word
}
    
    func Alphatesting (_ key: String) -> Bool {
        var Alphathere = true
        let nkey = key.uppercased()
        for character in nkey {
            if !(character.unicodeScalars.first!.value >= 65 && character.unicodeScalars.first!.value <= 90) {
                Alphathere = false
            }
        }
        return Alphathere
    }
}