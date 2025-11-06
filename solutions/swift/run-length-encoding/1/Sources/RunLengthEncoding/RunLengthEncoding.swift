class RunLengthEncoding {
    
    static func encode(_ phrase : String) -> String {
      if phrase.isEmpty { return "" }
      
      let chars = Array(phrase)
      var currentChar: Character = chars[0]                                 
      var count: Int = 1
      var result: String = ""
      
      for char in chars.dropFirst() {
        if char == currentChar {
          count += 1
        } else {
          result += count == 1 ? "\(currentChar)" : "\(count)\(currentChar)"
          currentChar = char
          count = 1
        }
      }
      
      result += count == 1 ? "\(currentChar)" : "\(count)\(currentChar)"
      return result
    }

    static func decode(_ phrase : String) -> String {
      if phrase.isEmpty { return "" }
  
      let chars = Array(phrase)
      var digit = ""
      var count: Int = 0
      var result = ""
      
      for char in chars {
        let currentChar = char
        if let digitValue = currentChar.wholeNumberValue {
          digit.append(currentChar)
        } else {
          let multiplier = Int(digit) ?? 1
          digit = ""
          result += String(repeating: String(currentChar), count: multiplier)
        }
      }
      
      return result
    }
}
