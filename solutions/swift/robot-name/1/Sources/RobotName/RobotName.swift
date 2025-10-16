import Foundation

class Robot {
  nonisolated(unsafe) private static var nameRepo: [String] = []
  
  private static let upperAlphas: [UInt8] = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ".utf8)
  private static let digits: [UInt8] = Array("0123456789".utf8)
  private var _name: String = ""

  //Make this read-only property so the client won't assign a String directly
  //Though the provided tests do not check this issue
  var name: String {
    _name
  }
  
  init() {
    resetName()
  }
  
  func resetName() {
    self._name = ""
    
    for _ in 0..<2 {
      let randomAlpha: UInt8 = Robot.upperAlphas.randomElement()!
      _name.append(Character(UnicodeScalar(randomAlpha)))
    }
    
    for _ in 0..<3 {
      let randomDigit: UInt8 = Robot.digits.randomElement()!
      _name.append(Character(UnicodeScalar(randomDigit)))
    }
    
    if Robot.nameRepo.contains(_name) {
      resetName()
    } else {
      Robot.nameRepo.append(_name)
    }
  }
}
