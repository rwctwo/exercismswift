class CollatzConjecture {
  enum InputError: Error {
    case invalid
  }
  
  static func steps(_ number: Int) throws -> Int? {
    if number < 1 {
      throw InputError.invalid
    }
    
    var cnt = 0
    var num = number
    
    while num != 1 {
      if num.isMultiple(of: 2) {
        num /= 2
      } else {
        num = 3 * num + 1
      }
      cnt += 1
    }
    
    return cnt
  }
}
