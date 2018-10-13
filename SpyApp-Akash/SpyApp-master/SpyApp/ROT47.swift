//
//  ROT47.swift
//  SpyApp
//
//  Created by Akash Sheladiya on 9/13/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//
import Foundation

struct ROT47: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String {
        
        if !plaintext.isEmpty && Alphatesting(plaintext) {
            var encoded = ""
            if Int32(secret) == nil {
                return "Not a Valid Input."
            }
            var shift = Int32(47)
            
            if Int32(secret)! <= -26 {
                shift = Int32(secret)! % -26
            }
            if Int32(secret)! >= 26 {
                shift = Int32(secret)! % 26
            }
            let word = plaintext.uppercased()
            for character in word {
                let unicode = character.unicodeScalars.first!.value
                var shiftedUnicode = Int32(unicode) + shift
                if (shiftedUnicode < 65) {
                    let toshift = 64 - shiftedUnicode
                    shiftedUnicode = 90 - toshift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print ("ShiftedUnicode < 65: \(shiftedUnicode)")
                    continue
                }
                else if (shiftedUnicode > 90) {
                    let toshift = shiftedUnicode - 90
                    shiftedUnicode = 64 + toshift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print ("ShiftedUnicode > 90: \(shiftedUnicode)")
                    continue
                }
                else {
                    let shiftedUnicode = Int32(unicode) + shift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                }
            }
            return encoded
        }
        else {
            return "Not a valid Alphabetic String!"
        }
    }
    
    func decode(_ plaintext: String, secret: String) -> String {
        
        if Alphatesting(plaintext) {
            var decoded = ""
            if Int32(secret) == nil {
                return "Not a Valid Input."
            }
            var shift = Int32(47)
            
            if Int32(secret)! <= -26 {
                shift = Int32(secret)! % -26
            }
            if Int32(secret)! >= 26 {
                shift = Int32(secret)! % 26
            }
            let word = plaintext.uppercased()
            for character in word {
                let unicode = character.unicodeScalars.first!.value
                var shiftedUnicode = Int32(unicode) - shift
                if (shiftedUnicode < 65) {
                    let toshift = 64 - shiftedUnicode
                    shiftedUnicode = 90 - toshift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    decoded = decoded + shiftedCharacter
                    print ("ShiftedUnicode < 65: \(shiftedUnicode)")
                    continue
                }
                else if (shiftedUnicode > 90) {
                    let toshift = shiftedUnicode - 90
                    shiftedUnicode = 64 + toshift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    decoded = decoded + shiftedCharacter
                    print ("ShiftedUnicode > 90: \(shiftedUnicode)")
                    continue
                }
                else {
                    let shiftedUnicode = Int32(unicode) - shift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    decoded = decoded + shiftedCharacter
                    print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                }
            }
            return decoded
        }
        else {
            return "Not a valid Alphabetic String!"
        }
    }
    
    func Alphatesting (_ key: String) -> Bool {
        var Alphathere = true
        let nKey = key.uppercased()
        for character in nKey {
            if !(character.unicodeScalars.first!.value >= 65 && character.unicodeScalars.first!.value <= 90) {
                Alphathere = false
            }
        }
        return Alphathere
    }
}