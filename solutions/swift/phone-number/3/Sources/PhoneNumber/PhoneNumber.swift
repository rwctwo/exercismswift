

import Foundation

enum PhoneNumberError: LocalizedError {
  case invalidPhoneNumber
}

//Using CharacterSet instead of Regex
//I prefer using Regex because it works uniformly in other languages also.
//In other words the solution approach is less dependent on a particular language
//features and rules. When using CharacterSet, I need to take
//unicodeScalars for strings to make filter and contains work safely and correctly
class PhoneNumber {
  private let delimiters = CharacterSet(charactersIn: "+-.() ")
  private let letters = CharacterSet.letters
  private let symbols = CharacterSet(charactersIn: "@:!,?@#$%^&*")
  
  private var digits: String = "" //need to initialize here so filter in init works okay
  
  init (_ phoneNumber: String) throws {
    let stripDelim = phoneNumber.unicodeScalars.filter { !delimiters.contains($0) }
    digits = String(String.UnicodeScalarView(stripDelim))
  }
  
  func clean() throws -> String {
    
    if digits.unicodeScalars.contains(where: { letters.contains($0) }) ||
       digits.unicodeScalars.contains(where: { symbols.contains($0) }) ||
       digits.count < 10 || digits.count > 11 {
      throw PhoneNumberError.invalidPhoneNumber
    }
    
    if digits.count == 11 {
      if !digits.hasPrefix("1") {
        throw PhoneNumberError.invalidPhoneNumber
      }
      digits.removeFirst()
    }
    
    let chars = Array(digits)
    if chars[0] == "0" || chars[0] == "1" ||
       chars[3] == "0" || chars[3] == "1" {
      throw PhoneNumberError.invalidPhoneNumber
    }
     
    return digits
  }
}