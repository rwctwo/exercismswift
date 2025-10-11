import Foundation

func isArmstrongNumber(_ number: Int) -> Bool {
  
  //Approach 1: Functional style using string conversion
  let digits: [Int] = String(number).compactMap(\.wholeNumberValue)
  let exp = Double(digits.count)    //compactMap removes nil
  
  return number == digits.reduce(0) { acc, digit in
    acc + Int(pow(Double(digit), exp))
  }

  //Approach 2: Without string conversion
  // let digits = sequence(first: number, next: { $0 / 10})
  //           .prefix(while: { $0 > 0 })
  //           .map { $0 % 10 }
  // let exp = Double(digits.count)

  // return number == digits.reduce(0) { acc, digit in
  //   acc + Int(pow(Double(digit), exp))
  // }
  
  //Approach 3: Basic loops without string conversion
  // var digits: [Int] = []
  // var num = number
   
  // while (num > 0) { //break into individual digits
  //   digits.append(num % 10)
  //   num /= 10
  // }
   
  // var sum: Int = 0
  // let exp = Double(digits.count)
  // for digit in digits {
  //   sum += Int(pow(Double(digit), exp))
  // }
  
  // return sum == number

  
}
