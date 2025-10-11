import Foundation

struct HighScores {
  
  var topThree : [Int]
  var personalBest: Int
  var latest: Int
  var scores: [Int]

  init(scores: [Int]) {
    guard scores.count > 0 else { fatalError("scores cannot be empty") }
    
    self.scores = scores
    latest = scores.last!
    
    let _scores = scores.sorted(by: >)
    topThree = Array(_scores.prefix(3))
    personalBest = _scores.first!
  }
}