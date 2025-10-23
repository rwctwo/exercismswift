//Standard algorithm for finding prime factors
func primeFactors(_ number: Int64) -> [Int64] {
   guard number > 1 else { return [] }
  
  var factors: [Int64] = []
  var x = number
  
  //Factor out 2s
  while x % 2 == 0 {
    factors.append(2)
    x /= 2
  }
  
  //Now x is an odd number. Find odd factors.
  //Odd divided by another odd is always an odd
  var f: Int64 = 3
  while f * f <= x {
    while x % f == 0 {
      factors.append(f)
      x /= f
    }
    f += 2
  }
  
  // There's still a remainder, which is a prime
  // like 5 when finding factors for 60
  if x > 1 {
    factors.append(x)
  }
  
  return factors
}
