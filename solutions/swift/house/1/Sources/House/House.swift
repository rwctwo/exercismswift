class House {
  private static let clause: [String] =
    ["the house that Jack built.",
     "the malt that lay in",
     "the rat that ate",
     "the cat that killed",
     "the dog that worried",
     "the cow with the crumpled horn that tossed",
     "the maiden all forlorn that milked",
     "the man all tattered and torn that kissed",
     "the priest all shaven and shorn that married",
     "the rooster that crowed in the morn that woke",
     "the farmer sowing his corn that kept",
     "the horse and the hound and the horn that belonged to"
    ]
  
  private static func verse(_ number: Int) -> String {
    var reply = "This is"
    
    for i in 0..<number {
      reply.append(" \(clause[number-i-1])")
    }
    
    return reply
  }

  //Not input validation test is done
  static func recite(start: Int, end: Int) -> String {
    var verses = ""
    
    for i in stride(from: start, through: end-1, by: 1) {
      verses.append(verse(i) + "\n")
    }
    verses.append(verse(end))
    
    return verses
  }
}
