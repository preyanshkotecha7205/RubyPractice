import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "cesar": CeasarCipher (),
        "alphanumcesar" : AlphaNumericCesarCipher(),
        "ROT47" : ROT47(),
        "VigenereCipher" : VigenereCipher()
    ]

    func cipher(for key: String) -> Cipher {
        
        return ciphers[key]!
    }
}
