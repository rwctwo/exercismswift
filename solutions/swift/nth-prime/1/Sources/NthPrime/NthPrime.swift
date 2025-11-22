enum PrimeError: Error {
  case noZerothPrime
}

func nthPrime(_ n: Int) throws -> Int {
  guard n >= 1 else { throw PrimeError.noZerothPrime }
  if n == 1 { return 2 }
  
  var primes: [Int] = [2]
  var candidate = 3
  
  while primes.count < n {
    var isPrime = true
    let limit = Int(Double(candidate).squareRoot())
    for p in primes {
      if p > limit { break }
      if candidate % p == 0 {
        isPrime = false
        break
      }
    }
    if isPrime {
      primes.append(candidate)
    }
    candidate += 2 // only odd numbers
  }
  
  return primes[n - 1]
}