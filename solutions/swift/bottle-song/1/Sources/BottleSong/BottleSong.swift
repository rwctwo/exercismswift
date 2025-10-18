class BottleSong {
  
  let bottles: Int
  let number: [String] = ["No", "One", "Two", "Three", "Four", "Five",
                              "Six", "Seven", "Eight", "Nine", "Ten"]
  
  init(bottles: Int) {
    guard bottles > 0 && bottles < 11 else { fatalError("Invalid bottle count") }
    self.bottles = bottles
  }
  
  func song(takedown: Int) -> [String] {
    guard takedown > 0 && takedown <= bottles else { fatalError("Invalid takedown") }
    
    var lyrics: [String] = []
    var cnt = bottles
    
    for i in 0..<takedown {
      lyrics.append("\(number[cnt-i]) green \(cnt-i == 1 ? "bottle" : "bottles") hanging on the wall,")
      lyrics.append("\(number[cnt-i]) green \(cnt-i == 1 ? "bottle" : "bottles") hanging on the wall,")
      lyrics.append("And if one green bottle should accidentally fall,")
      lyrics.append("There'll be \(number[cnt-i-1].lowercased()) green \(cnt-i-1 == 1 ? "bottle" : "bottles") hanging on the wall.")
      lyrics.append("") //need to include this blank line between verses
    }
    lyrics.removeLast() //except the very last blank line
    
    return lyrics
  }
}