func rotateCipher(_ input: String, shift: Int) -> String {
  let lowercase: [Character] = Array("abcdefghijklmnopqrstuvwxyz")
  let uppercase: [Character] = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
  var cipherText: String = ""
  
  for letter in input {
    if let index = lowercase.firstIndex(of: letter) { //'a'...'z'
      cipherText.append(lowercase[(index + shift) % 26])
      
    } else if let index = uppercase.firstIndex(of: letter) { //'A'...'Z'
      cipherText.append(uppercase[(index + shift) % 26])
      
    } else {
      cipherText.append(letter) //bypass non-letter characters
    }
  }
  
  return cipherText
}
