enum OcrNumberError : Error {
  case invalidInput
}

class OcrNumber {
  private static let digits: [String : String] = [
    " _ | ||_|   ": "0",
    "     |  |   ": "1",
    " _  _||_    ": "2",
    " _  _| _|   ": "3",
    "   |_|  |   ": "4",
    " _ |_  _|   ": "5",
    " _ |_ |_|   ": "6",
    " _   |  |   ": "7",
    " _ |_||_|   ": "8",
    " _ |_| _|   ": "9",
  ]
  
  private static func transpose(_ ocrLine: [String]) throws -> [String] {
    //transpose ocrLine, so ocrDigits is a sequence of
    //individual ocr. each ocrDigits[i] is a complete ocr digit
    var ocrDigits : [String] = []
    
    let digitCount = ocrLine[0].count
    for i in stride(from: 0, to: digitCount, by: 3) {
      var digit: String = ""
      for j in 0..<4 {
        let str = ocrLine[j]
        let startIndex = str.index(str.startIndex, offsetBy: i)
        let endIndex = str.index(startIndex, offsetBy: 3, limitedBy: str.endIndex) ?? str.endIndex
        if str.distance(from: startIndex, to: endIndex) != 3 { throw OcrNumberError.invalidInput }
        digit.append(String(str[startIndex..<endIndex]))
      }
      ocrDigits.append(digit)
    }
    
    return ocrDigits
  }
  
  private static func digitsInLine(_ ocrLine: [String]) throws -> String {
    //one ocrLine is a sequence of ocr digits.
    //each ocr digit is represented by the respective
    //3 characters from ocrLine[0], ocrLine[1], ocrLine[2],and
    //ocrLine[3]
    var result = ""
    
    result = try transpose(ocrLine).map{ digits[$0] ?? "?" }.joined()
    
    return result
  }
  
  static func convert(rows: [String]) throws -> String {
    guard rows.count.isMultiple(of: 4) else { throw OcrNumberError.invalidInput }
    var result: [String] = []
    
    for start in stride(from: 0, to: rows.count, by: 4) {
      let startIndex = rows.index(rows.startIndex, offsetBy: start)
      let endIndex = rows.index(startIndex, offsetBy: 4)
      result.append(try digitsInLine(Array(rows[startIndex..<endIndex])))
    }
    
    return result.joined(separator: ",")
  }
}
