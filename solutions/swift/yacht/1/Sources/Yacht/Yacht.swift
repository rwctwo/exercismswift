func score(_ scores: [Int], category: YachtCategory) -> Int {
  
  func count(_ digit: Int) -> Int { scores.filter{ $0 == digit }.count * digit }
  
  var points = 0
  
  switch category {
  case .ones:   points = count(1)
  case .twos:   points = count(2)
  case .threes: points = count(3)
  case .fours:  points = count(4)
  case .fives:  points = count(5)
  case .sixes:  points = count(6)
  case .fullHouse:
    let dict = Dictionary(grouping: scores, by: { $0 })
    if dict.count == 2 && dict.allSatisfy(  { $0.value.count >= 2 } ) {
      points = dict.mapValues{ $0.reduce(0,+) }.values.reduce(0, +)
    }
  case .fourOfAKind:
    for digit in 1...6 {
      if scores.filter({ $0 == digit }).count >= 4 { points = 4 * digit }
    }
  case .littleStraight: if scores.sorted() == [1, 2, 3, 4, 5] { points = 30 }
  case .bigStraight: if scores.sorted() == [2, 3, 4, 5, 6] { points = 30 }
  case .choice:  points = scores.reduce(0, +)
  case .yacht: if Set(scores).count == 1 { points = 50 }
  }
  
  return points
}