enum BaseError: Error {
  case invalidInputBase
  case invalidOutputBase
  case invalidPositiveDigit
  case negativeDigit
}

//Using 'guard' statements when throwing errors is a bit
//more logical than using 'if'
struct Base {
  static func outputDigits(inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {
    
    var newBaseDigits: [Int] = []
    
    guard inputBase > 1 else { throw BaseError.invalidInputBase }
    guard outputBase > 1 else { throw BaseError.invalidOutputBase }
    
    //convert input to base-10
    var factor = 1
    var base10Value: Int = 0
    
    for (index, digit) in inputDigits.reversed().enumerated() {
      guard digit >= 0 else { throw BaseError.negativeDigit }
      guard digit < inputBase else { throw BaseError.invalidPositiveDigit }
      
      base10Value += digit * factor
      factor *= inputBase
    }
    
    if base10Value == 0 { return [0] } //this test handles cases like
                                        //[], [0], [0, 0, 0] -> [0]
    //convert it to new base
    while (base10Value > 0) {
      newBaseDigits.append(base10Value % outputBase)
      base10Value /= outputBase
    }
    
    return newBaseDigits.reversed()
  }
}
