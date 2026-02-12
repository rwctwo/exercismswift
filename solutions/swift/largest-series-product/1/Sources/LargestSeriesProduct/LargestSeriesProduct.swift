enum NumberSeriesError: Error {
  case spanLongerThanInput
  case invalidCharacter
  case spanIsZeroOrNegative
}

class NumberSeries {
  private var numStr: String
  
  //provided tests do not clarify whether the constructor
  //should throw an invalid character error or not
  init(_ str: String) {
    numStr = str
  }
  
  private func extractNumbers(from input: String, span: Int) throws -> [Int] {
    guard span > 0 else { throw NumberSeriesError.spanIsZeroOrNegative }
    guard input.count >= span else { throw NumberSeriesError.spanLongerThanInput }
    
    var numbers: [Int] = []
    
    for i in 0...(input.count - span) {
      let startIndex = input.index(input.startIndex, offsetBy: i)
      let endIndex = input.index(startIndex, offsetBy: span)
      let substring = String(input[startIndex..<endIndex])
      
      if let number = Int(substring) {
        if substring.contains("0") { //need this test so number like "099"
          numbers.append(0)          //is processed correctly
        } else {
          numbers.append(number)
        }
      } else {
        throw NumberSeriesError.invalidCharacter
      }
    }
    return numbers
  }
  
  private func product(of number: Int) -> Int {
    var prod = 1
    var num = number
    
    if num == 0 { return 0 }
    
    while num > 0 {
      let digit = num % 10
      prod *= digit
      num /= 10
    }
    
    return prod
  }
  
  func largestProduct(_ length: Int) throws -> Int {
    let numbers = try extractNumbers(from: numStr, span: length)
    let products = numbers.map(product)
    return products.max() ?? 0
  }
}
