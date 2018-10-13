import Foundation 

protocol Cipher {
	func encode(_ plaintest: String, secret: String) -> String
	func decode(_ plaintext: String, secret: String) -> String
}

struct CeasarCipher: Cipher {
	
	func encode(_ plaintext: String, secret: String) -> String {


	if !plaintext.isEmpty && Alphatesting(plaintext) {
			var encoded = ""
			if Int32(secret) == nil {

				return "Not a Valid Input."
				}
				
				var shift = Int32(secret)!

				print (shift)

				if Int32(secret)! <= -26 {
				 shift = Int32(secret)! % -26
				}
				
				if Int32(secret)! >= 26 {
				 shift = Int32(secret)! % 26
				}

			let word = plaintext.uppercased()
			for character in word{

				let unicode = character.unicodeScalars.first!.value
				var shiftedUnicode = Int32(unicode) + shift

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
						let shiftedUnicode = Int32(unicode) + shift
						let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
						}
					}
				return encoded
				}
					else{
					return "Only alphabets allowed for encrpytion!"
				}

			}

	func decode(_ plaintext: String, secret: String) ->  String {

		print ("decoding : \(plaintext)")


	 if Alphatesting(plaintext) {
            var encoded = ""
            if Int32(secret) == nil {
                return "Not a Valid Input."
            }
            var shift = Int32(secret)!
            
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
                    let shifting = 64 - shiftedUnicode
                    shiftedUnicode = 90 - shifting
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print ("ShiftedUnicode < 65: \(shiftedUnicode)")
                    continue
                }
                else if (shiftedUnicode > 90) {
                    let shifting = shiftedUnicode - 90
                    shiftedUnicode = 64 + shifting
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print ("ShiftedUnicode > 90: \(shiftedUnicode)")
                    continue
                }
                else {
                    let shiftedUnicode = Int32(unicode) - shift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                }
            }
            return encoded
        }
        else {
            return "please enter valid words with alphabets only"
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
