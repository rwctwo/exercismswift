//Brute force solution
func sieve(limit: Int) -> [Int] {
  guard limit > 1 else { return [] }
    
    var numbers = Array(stride(from: 2, through: limit, by: 1))
    var primes = numbers.map { (value: $0, isPrime: true) }
  
    for i in 0..<primes.count {
      if primes[i].isPrime {
        let incr = primes[i].value
        for j in stride(from: i + incr, to: primes.count, by: incr) {
          primes[j].isPrime = false
        }
      }
    }
    
    return primes.filter { $0.isPrime }.map { $0.value }
}
