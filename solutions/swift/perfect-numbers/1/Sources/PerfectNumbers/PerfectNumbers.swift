enum Classification {
  case perfect
  case abundant
  case deficient
}

enum ClassificationError: Error {
  case invalidInput
}

func classify(number: Int) throws -> Classification {

  func factors(of n: Int) -> Set<Int> {
    if n <= 1 { return [] }  //no proper divisors
    if n == 2 { return [1] } //avoid 'limit' becoming 1

    var result: Set<Int> = [1]
    let limit = Int(Double(n).squareRoot())

    for i in 2...limit {
      if n % i == 0 {
        result.insert(i)
        result.insert(n / i)
      }
    }

    return result
  }

  if number <= 0 { throw ClassificationError.invalidInput }

  let factorSum = factors(of: number).reduce(0, +)
  if number > factorSum {
    return .deficient
  } else if number < factorSum {
    return .abundant
  } else {
    return .perfect
  }
}
