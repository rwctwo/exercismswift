//Version 2:
//Subtraction Approach. Keep subtracting each magnitude 1000, 900, 500, ..., 5, 4, and 1
//and appending the corresponding Roman numeral.
extension Int {
  private func romanNumeralValues(_ i: Int) -> (num: Int, roman: String) {
    return [
      (1000, "M"),
      (900, "CM"),
      (500, "D"),
      (400, "CD"),
      (100, "C"),
      (90, "XC"),
      (50, "L"),
      (40, "XL"),
      (10, "X"),
      (9, "IX"),
      (5, "V"),
      (4, "IV"),
      (1, "I")
    ][i]
  }
  
  //Convert self to Roman Numeral
  public func toRomanNumeral() -> String {
    guard self > 0 && self < 4000 else { return "" }
    
    var result: String = ""
    var number = self
    
    for val in 0..<13 {
      let (num, roman) = romanNumeralValues(val)
      
      while number >= num {
        result.append(roman)
        number -= num
      }
    }
    
    return result
  }
}
