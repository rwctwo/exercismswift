class Proverb {
  private var reply: String = ""
  
  init(_ words: [String]) {
    if !words.isEmpty {
      for i in 0..<words.count-1 {
        reply.append("For want of a \(words[i]) the \(words[i+1]) was lost.\n")
      }
      reply.append( "And all for the want of a \(words.first!).")
    }
  }
  
  func recite() -> String {
    reply
  }
}
