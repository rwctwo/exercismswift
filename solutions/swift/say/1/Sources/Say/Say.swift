enum SayError: Error {
  case outOfRange
}

func say(number: Int) throws -> String {
  //convert 0, ..., 999 to English
  func toEnglish(_ num: Int) -> String { 
    let ones: [String] = ["", "one", "two", "three", "four", "five",
                          "six", "seven", "eight", "nine"]
    let teens: [String] = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
                           "sixteen", "seventeen", "eighteen", "nineteen"]
    let tens: [String] = ["", "", "twenty", "thirty", "forty", "fifty",
                          "sixty", "seventy", "eighty", "ninety"]
    
    let hundred = num / 100
    let ten = num / 10 % 10
    let one = num % 10
    
    var result: String = ""
    
    if hundred > 0 {
      result += ones[hundred] + " hundred"
    }
    
    if ten == 0 {
      result += one == 0 ? "" : hundred == 0 ? ones[one] : " " + ones[one]
      
    } else if ten == 1 {
      result += hundred == 0 ? teens[one] : " " + teens[one]
      
    } else {
      result += hundred == 0 ? tens[ten] : " " + tens[ten]
      if one > 0 { result += "-" + ones[one] }
    }
    
    return result
  }
  
  if number < 0 { throw SayError.outOfRange }
  if number == 0 { return "zero" }
  if number > 999_999_999_999 { throw SayError.outOfRange }
  
  let scaleWords = ["", "thousand", "million", "billion"]
  
  var num = number
  var chunks: [Int] = []
  
  while num > 0 {
    chunks.append(num % 1000)
    num /= 1000
  }
  
  return zip(chunks, scaleWords).map { val, scale in
            val == 0 ? "" : toEnglish(val) + (scale.isEmpty ? "" : " " + scale)
          }
          .reversed()
          .filter{ !$0.isEmpty } //remove "" entries representing 0
          .joined(separator: " ")
  
}
