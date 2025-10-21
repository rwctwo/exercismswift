enum BaseError: Error {
  case invalidInputBase
  case invalidOutputBase
  case invalidPositiveDigit
  case negativeDigit
}

struct Base {
  static func outputDigits(inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {
    
    var newBaseDigits: [Int] = []
    
    if inputBase < 2 { throw BaseError.invalidInputBase }
    if outputBase < 2 { throw BaseError.invalidOutputBase }
    
    //convert input to base-10
    var factor = 1
    var base10Value: Int = 0
    
    for (index, digit) in inputDigits.reversed().enumerated() {
      if digit < 0 { throw BaseError.negativeDigit }
      if digit >= inputBase { throw BaseError.invalidPositiveDigit }
      base10Value += digit * factor
      factor *= inputBase
    }

    if base10Value == 0 { return [0] } //this test multiple 0's like
                                        //[0, 0, 0] -> [0]
    //convert it to new base
    while (base10Value > 0) {
      newBaseDigits.append(base10Value % outputBase)
      base10Value /= outputBase
    }
    
    return newBaseDigits.reversed()
  }
}
