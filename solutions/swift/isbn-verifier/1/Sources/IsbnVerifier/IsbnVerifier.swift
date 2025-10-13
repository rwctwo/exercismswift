// Check ISBN-10
// Examples of valid syntax: "3-598-21508-8", "3-598-21507-X", "3598215088"
// Validation rule:
// (x1 * 10 + x2 * 9 + x3 * 8 + x4 * 7 + x5 * 6 + x6 * 5 + x7 * 4 + x8 * 3 + x9 * 2 + x10 * 1) % 11 == 0
import Foundation

class IsbnVerifier {
  static func isValid(_ isbn: String) -> Bool {
    let cleaned = isbn.replacingOccurrences(of: "-", with: "")
  
    guard cleaned.count == 10 else { return false }
  
    var chars = Array(cleaned)
  
    //last digit must be a number or must be an 'X'
    if !(chars[9].isNumber || chars[9] == "X") {
      return false
    }
    
    var sum = 0
    for i in 0..<9 {
      let weight = 10 - i
  
      if let digit = chars[i].wholeNumberValue {
        sum += digit * weight
      } else {
        return false
      }
    }
  
    if chars[9] == "X" { //check the last digit
      sum += 10
    } else {
      sum += Int(String(chars[9]))!
    }
    
    return sum % 11 == 0
  }
}
