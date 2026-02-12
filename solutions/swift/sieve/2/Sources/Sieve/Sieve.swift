import Foundation

/*
Improved Version: 
1. Memory improvement by using just an array of boolean and make its index
the int value we compute for primeness. We add two extra items at the front
so the index and the value matches, i.e. arr[i] is tells the primeness of number
i. 
2. Optimization by reducing the numbers we check for primeness using the 
the standard optimizations, such as, checking the primeness of n until sqrt(limit)
*/
func sieve(limit: Int) -> [Int] {
  guard limit >= 2 else { return [] }

  var isPrime = Array(repeating: true, count: limit + 1)
  isPrime[0] = false
  isPrime[1] = false

  var num = 2
  while num * num <= limit { //consider up to sqrt(limit)
    if isPrime[num] {
      var multiple = num * num //factors of all numbers < num are already 
                               //processed, so no need to start from num
      while multiple <= limit {
        isPrime[multiple] = false
        multiple += num
      }
    }
    num += 1
  }

  var primes: [Int] = []
  //pre allocate enough space to avoid reallocation
  //Prime Theorem states # of primes from 2...limit is bounded by
  // limit / log(limit)
  primes.reserveCapacity(Int(Double(limit) / log(Double(limit))))
  for i in 2...limit {
    if isPrime[i] { primes.append(i) }
  }
  
  return primes
}
