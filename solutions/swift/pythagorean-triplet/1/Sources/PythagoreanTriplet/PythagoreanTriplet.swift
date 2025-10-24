func tripletsWithSum(_ sum: Int) -> [[Int]] {
  var triplets: [[Int]] = []
  if sum < 6 { return triplets }
  
  //Generate values a, b, and c, such that
  // 1. a < b < c
  // 2. a + b + c == sum
  // 3. a*a + b*b == c*c
  //
  for a in 1...(sum / 3) {   //max a is less than one third of sum
    let maxB = (sum - a) / 2 //max b cannot be more than
    if a + 1 <= maxB {       //half of the remainder sum - a
      for b in (a + 1)...maxB {
        let c = sum - a - b
        if a * a + b * b == c * c {
          triplets.append([a, b, c])
        }
      }
    }
  }
  
  return triplets
}
