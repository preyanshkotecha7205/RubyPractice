//
//  AlphanumericCesarCipher.swift
//  SpyApp
//
//  Created by Akash Sheladiya on 9/12/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//
import Foundation

struct AlphaNumericCesarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String {
        
        var encoded = ""
        if (Alphanumerictest(plaintext)){
            if Int32(secret) == nil {
                return "Not a Valid Input."
            }
            if Int32(secret) == 0 {
                return "Enter a Shift key greatre then 0!"
            }
            var shiftchar = Int32(secret)!
            var shiftdigit = Int32(secret)!
            if shiftchar <= -26 {
                shiftchar = Int32(secret)! % -26
            }
            if shiftchar >= 26 {
                shiftchar = Int32(secret)! % 26
            }
            if shiftdigit <= -9 {
                shiftdigit = Int32(secret)! % -9
            }
            if shiftdigit >= 9 {
                shiftdigit = Int32(secret)! % 9
            }
            print("Char: \(shiftchar)")
            let word = plaintext.uppercased()
            print ("Digit: \(shiftdigit)")
        for character in word {
            let unicode = character.unicodeScalars.first!.value
            //print ("Unicode: \(unicode)")
            if chartesting(character) {
                var shiftedUnicode = Int32(unicode) + shiftchar
                if (shiftedUnicode < 65) {
                    let shifting = 64 - shiftedUnicode
                     shiftedUnicode = 90 - shifting
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    continue
                }
                 else if (shiftedUnicode > 90) {
                    let shifting = shiftedUnicode - 90
                     shiftedUnicode = 64 + shifting
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                     continue
                }
                else {
                let shiftedUnicode = Int32(unicode) + shiftchar
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
                }
            }
            else {
                var shiftedUnicode = Int32(unicode) + shiftdigit
                print("shifted: \(shiftedUnicode)")
                if (shiftedUnicode < 48) {
                    let shifting = 47 - shiftedUnicode
                    shiftedUnicode = 57 - shifting
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    continue
                }
                if (shiftedUnicode > 57) {
                    let shifting = shiftedUnicode - 57
                    shiftedUnicode = 47 + shifting
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    continue
                }
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
                print ("ShiftedUnicode neutral: \(shiftedUnicode)")
            }
        }
        }
        else {
            print(plaintext)
            return "Not a valid AlphaNumeric String!"
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String {
        
        var decoded = ""
        if (Alphanumerictest(plaintext)){
            if Int32(secret) == nil {
                return "Not a Valid Input."
            }
            if Int32(secret) == 0 {
                return "Enter a Shift key greatre then 0!"
            }
            var shiftchar = Int32(secret)!
            var shiftdigit = Int32(secret)!
            if shiftchar <= -26 {
                shiftchar = Int32(secret)! % -26
            }
            if shiftchar >= 26 {
                shiftchar = Int32(secret)! % 26
            }
            if shiftdigit <= -9 {
                shiftdigit = Int32(secret)! % -9
            }
            if shiftdigit >= 9 {
                shiftdigit = Int32(secret)! % 9
            }
            print("Char: \(shiftchar)")
            let word = plaintext.uppercased()
            print ("Digit: \(shiftdigit)")
            for character in word {
                let unicode = character.unicodeScalars.first!.value
                if chartesting(character) {
                    var shiftedUnicode = Int32(unicode) - shiftchar
                    if (shiftedUnicode < 65) {
                        let shifting = 64 - shiftedUnicode
                        shiftedUnicode = 90 - shifting
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                        continue
                    }
                    else if (shiftedUnicode > 90) {
                        let shifting = shiftedUnicode - 90
                        shiftedUnicode = 64 + shifting
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                        continue
                    }
                    else {
                        let shiftedUnicode = Int32(unicode) - shiftchar
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                    }
                }
                else {
                    var shiftedUnicode = Int32(unicode) - shiftdigit
                    if (shiftedUnicode < 48) {
                        let shifting = 47 - shiftedUnicode
                        shiftedUnicode = 57 + shifting
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                        continue
                    }
                    if (shiftedUnicode > 57) {
                        let shifting = shiftedUnicode - 57
                        shiftedUnicode = 47 + shifting
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                        continue
                    }
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    decoded = decoded + shiftedCharacter
                    print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                }
            }
        }
        else {
            print(plaintext)
            return "Not a valid AlphaNumeric String!"
        }
        return decoded
    }
    
    func Alphanumerictest (_ key: String) -> Bool  {
       
        let nKey = key.uppercased()
        for character in nKey {
                if (character.unicodeScalars.first!.value >= 65 && character.unicodeScalars.first!.value <= 90) {
                   continue
                }
                else if UInt32(String(character)) != nil {
                   continue
                }
                else {
                  return false
                  }
            
            }
        return true

    }
    
    func chartesting (_ value: Character) -> Bool {
        
        if value.unicodeScalars.first!.value >= 65 && value.unicodeScalars.first!.value <= 90 {
            
            return true
        }
        
        return false
    }
    
}
