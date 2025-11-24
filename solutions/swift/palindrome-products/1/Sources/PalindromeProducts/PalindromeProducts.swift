import Foundation

enum PalindromeError: Error {
  case invalidRange
}
  
class PalindromeProducts {
  
  private static func isPalindrome(_ num: Int) -> Bool {
    let numStr = String(num)
    let reversedNumStr = String(numStr.reversed())
    
    return numStr == reversedNumStr
  }
  
static func getFactors(of n: Int, in range: ClosedRange<Int>) -> Set<[Int]> {
    var pairs = Set<[Int]>()
    guard n > 0 else { return pairs }
    let lower = range.lowerBound
    let upper = range.upperBound
    
    // Only need to iterate up to sqrt(n)
    let limit = Int(Double(n).squareRoot())
    var a = max(lower, 1)
    while a <= min(upper, limit) {
      if n % a == 0 {
        let b = n / a
        if range.contains(b) {
          let lo = min(a, b)
          let hi = max(a, b)
          pairs.insert([lo, hi])
        }
      }
      a += 1
    }
    return pairs
  }
  
static func largest(from: Int, to: Int) throws -> (value: Int?, factors: Set<[Int]>) {
    guard from <= to else { throw PalindromeError.invalidRange }
    
    var result: (value: Int?, factors: Set<[Int]>) = (value: nil, factors: [])
    let start = to * to
    let end = from * from

    for num in stride(from: start, to: end, by: -1) {
      if isPalindrome(num) {
        let factors = getFactors(of: num, in: from...to)
        if !factors.isEmpty {
          result = (num, factors)
          break
        }
      }
    }
    
    return result
  }
  
  static func smallest(from: Int, to: Int) throws -> (value: Int?, factors: Set<[Int]>) {
    guard from <= to else { throw PalindromeError.invalidRange }
    
    var result: (value: Int?, factors: Set<[Int]>) = (value: nil, factors: [])
    let start = from * from
    let end = to * to
    
    for num in start...end {
      if isPalindrome(num) {
        let factors = getFactors(of: num, in: from...to)
        if !factors.isEmpty {
          result = (num, factors)
          break
        }
      }
    }

    return result
  }
}