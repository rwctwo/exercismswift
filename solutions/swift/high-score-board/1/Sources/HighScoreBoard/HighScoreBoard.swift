func newScoreBoard() -> [String: Int] {
  // fatalError("Please implement the addPlayer() function")
  return [String: Int]()
}

func addPlayer(_ scores: inout [String: Int], _ name: String, _ score: Int = 0) {
  // fatalError("Please implement the addPlayer(_:_:_:) function")
  scores[name] = score
}

func removePlayer(_ scores: inout [String: Int], _ name: String) {
  // fatalError("Please implement the removePlayer(_:_:) function")
  scores.removeValue(forKey: name)
}

func resetScore(_ scores: inout [String: Int], _ name: String) {
  // fatalError("Please implement the resetScore(_:_:) function")
  if let val = scores[name] { //update only if it already exists
    scores[name] = 0
  }
}

func updateScore(_ scores: inout [String: Int], _ name: String, _ delta: Int) {
  // fatalError("Please implement the updateScore(_:_:) function")
  if let val = scores[name] { //update only if it already exists
    scores[name] = val + delta
  }
}

func orderByPlayers(_ scores: [String: Int]) -> [(String, Int)] {
 // fatalError("Please implement the orderByPlayers(_:) function")
  func lexicalOrder(_ lhs: (String, Int), _ rhs: (String, Int)) -> Bool {
    lhs.0 < rhs.0
  }
  return scores.sorted(by: lexicalOrder)
}

func orderByScores(_ scores: [String: Int]) -> [(String, Int)] {
  // fatalError("Please implement the orderByScores(_:) function")
  func descending(_ lhs: (String, Int), _ rhs: (String, Int)) -> Bool {
    lhs.1 > rhs.1
  }
  return scores.sorted(by: descending)
}
