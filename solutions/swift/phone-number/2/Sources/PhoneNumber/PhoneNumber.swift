import Foundation

enum PhoneNumberError: LocalizedError {
  case invalidPhoneNumber
}

//Using Regex
class PhoneNumber {
  private let delim = /[+\-.\(\) ]/
  private let letter = /[a-zA-Z]/
  private let symbol = /[@:!,?\@#\$\%\^&\*]/
  
  private var digits: String
  
  init(_ phoneNumber: String) {
    digits = phoneNumber.split(separator: delim).joined()
  }
  
  func clean() throws -> String {
    if digits.contains(letter) || digits.contains(symbol) ||
       digits.count < 10 || digits.count > 11 {
      throw PhoneNumberError.invalidPhoneNumber
    }
    
    // Handle leading '1' for 11-digit numbers
    if digits.count == 11 {
      if !digits.hasPrefix("1") {
        throw PhoneNumberError.invalidPhoneNumber
      }
      digits.removeFirst()
    }
    
    // Area code and exchange code checks
    let chars = Array(digits)
    if chars[0] == "0" || chars[0] == "1"  ||
       chars[3] == "0" || chars[3] == "1" { 
        throw PhoneNumberError.invalidPhoneNumber 
    }
   
    return digits
  }
}
