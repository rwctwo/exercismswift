import Foundation

func isValidLuhn(_ number: String) -> Bool {
  let invalidChars = CharacterSet.decimalDigits
                                 .union(CharacterSet(charactersIn: " ")).inverted
  var total = 0
  
  if number.contains(where: { invalidChars.contains($0.unicodeScalars.first!) }) {
    return false
  }
  
  let reversedDigits = number.reversed().compactMap(\.wholeNumberValue)
  if reversedDigits.count < 2 { return false }
  
  for (index, digit) in reversedDigits.enumerated() {
    if (index+1).isMultiple(of: 2) {
      let doubled = digit * 2
      total += doubled > 9 ? doubled - 9 : doubled
    } else {
      total += digit
    }
  }
  
  if total.isMultiple(of: 10) { return true }
  
  return false
}
