// Vigenere cipher
import Foundation

struct Cipher {
  let key: String 
  //Need to define 'key' as String instead of [Character] to 
  //meet the test expect(cipher.key.range(of: pattern, options: .regularExpression) != nil
  let base = Character("a").asciiValue! //97
  
  init?(key: String) {
    guard !key.isEmpty,
          key.allSatisfy({ $0.isASCII && $0.isLowercase && $0 >= "a" && $0 <= "z" }) else {
      return nil
    }
    self.key = key
  }
  
  init( ) {
    let letters = Array("abcdefghijklmnopqrstuvwxyz")
    self.key = String((0..<100).compactMap { _ in letters.randomElement() })
  }
  
  func encode(_ text: String) -> String {
    let key = Array(self.key)
    let textLowercased = text.lowercased()
    let keyCount = key.count
    var encryptedText: [Character] = []
    encryptedText.reserveCapacity(textLowercased.count)
    
    for (index, char) in textLowercased.enumerated() {
      let keyIndex = (index % keyCount)
      let shift = UInt8(key[keyIndex].asciiValue! - base)
      let encodedValue = (char.asciiValue! - base + shift) % 26 + base
      
      encryptedText.append(Character(UnicodeScalar(encodedValue)))
    }
    
    return String(encryptedText)
  }
  
  func decode(_ text: String) -> String {
    let key = Array(self.key)
    let textLowercased = text.lowercased()
    let keyCount = key.count
    var decryptedText: [Character] = []
    decryptedText.reserveCapacity(textLowercased.count)
    
    for (index, char) in textLowercased.enumerated() {
      let keyIndex = (index % keyCount)
      let shift = UInt8(key[keyIndex].asciiValue! - base)
      let decodedValue = (26 + char.asciiValue! - base - shift) % 26 + base
      //As the type is UInt8, avoid arithmetic overflow error by adding 26 firt
      //so the value won't be negative
      
      decryptedText.append(Character(UnicodeScalar(decodedValue)))
    }
    
    return String(decryptedText)
  }
}