
func toLimit(_ limit: Int, inMultiples: [Int]) -> Int {

  //find multiples of k up to but not including 'limit'
  func multiples(of k: Int) -> Set<Int> {
    guard k != 0 else { return [] }
    return Set(stride(from: k, through: limit-1, by: k))
  }

  //1. Functional approach
  //we use .reduce(into:) to allow the mutability of $0
  //we could use .reduce(Set<Int>()) { $0.union($1) }
  //that returns a result, not mutate $0, which is a more
  //basic way of using functional reduce, but .reduce(into:)
  //more efficient becuase it won't generate intermediate sets
  
  return inMultiples.map(multiples)
  .reduce(into: Set<Int>()) { $0.formUnion($1) }
  .reduce(0, +)

  //2. Traditional procedural approach
  /*
  var result: Set<Int> = [] //use Set to easily remove duplicates

  for multiple in inMultiples {
    result.formUnion(multiples(of: multiple))
  }

  return result.reduce(0, +)
  */
}

