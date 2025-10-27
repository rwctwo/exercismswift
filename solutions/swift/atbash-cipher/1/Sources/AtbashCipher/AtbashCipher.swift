import Foundation

class AtbashCipher {
  static private let lowercase: [Character] = Array("abcdefghijklmnopqrstuvwxyz")
  
  static func encode(_ phrase: String) -> String {
    let removalSet = CharacterSet.punctuationCharacters.union(.whitespacesAndNewlines)
    let text = phrase.lowercased().components(separatedBy: removalSet).joined()
    var cipher: String = ""
   
    for ch in text {
      if let idx = lowercase.firstIndex(of: ch) {
        cipher.append(lowercase[25 - idx]) //alphbet
      } else {
        cipher.append(ch) //digit
      }
    }

    let limit = cipher.count.isMultiple(of: 5) ? //don't insert an extra
                    cipher.count / 5 - 1 :  //space the end when the string
                    cipher.count / 5        //length is multiple of 5
    
    for i in stride(from: 1, through: limit, by: 1) { 
      let nextIdx = cipher.index(cipher.startIndex, offsetBy: 5 * i + i-1)
      cipher.insert(" ", at: nextIdx)
    }
    
    return cipher
  }
  
  static func decode(_ phrase: String) -> String {
    var original = ""
    var cipher = phrase.split(separator: " ").joined()
    
    for ch in cipher {
      if let idx = lowercase.firstIndex(of: ch) {
        original.append(lowercase[25 - idx]) //alphbet
      } else {
        original.append(ch) //digit
      }
    }
    
    return original
  }
}