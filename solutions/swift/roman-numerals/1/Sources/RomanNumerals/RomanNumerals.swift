//Version 1:
//Spell out the possible Roman numerals for ones, tens, hundreds, 
//thousands positions
extension Int {
  private func romanNumeralValues(_ unit: Int, _ digit:Int) -> String {
    let values: [[String]] =
    [
      ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
      ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
      ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
      ["", "M", "MM", "MMM"]
    ]
    
    return values[unit-1][digit]
  }
  
  //Convert self to Roman Numeral
  public func toRomanNumeral() -> String {
    guard self > 0 && self < 4000 else { return "" }
    
    var result: String = ""
    var num = self
    var unit = 1
    while num > 0 {
      let digit = num % 10
      result = romanNumeralValues(unit, digit) + result
      num /= 10
      unit += 1
    }
    
    return result
  }
}
