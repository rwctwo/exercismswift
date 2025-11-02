struct FoodChain {
  private static let topVerses: [String] = [
    "",
    "fly.\n",
    "spider.\nIt wriggled and jiggled and tickled inside her.\n",
    "bird.\nHow absurd to swallow a bird!\n",
    "cat.\nImagine that, to swallow a cat!\n",
    "dog.\nWhat a hog, to swallow a dog!\n",
    "goat.\nJust opened her throat and swallowed a goat!\n",
    "cow.\nI don't know how she swallowed a cow!\n",
    "horse.\nShe's dead, of course!"
    ]
  
  private static let repeatVerses: [String] = [
    "",
    "I don't know why she swallowed the fly. Perhaps she'll die.",
    "She swallowed the spider to catch the fly.\n",
    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n",
    "She swallowed the cat to catch the bird.\n",
    "She swallowed the dog to catch the cat.\n",
    "She swallowed the goat to catch the dog.\n",
    "She swallowed the cow to catch the goat.\n"
  ]
  
  private static func topVerse(_ cnt: Int) -> String {
    return "I know an old lady who swallowed a " + topVerses[cnt]
  }
  
  private static func oneVerse(cnt: Int) -> String {
    var verse: String = topVerse(cnt)
    if cnt == 8 { return verse }
    
    for j in stride(from: cnt, through: 1, by: -1) {
      verse += repeatVerses[j]
    }
    return verse
  }
  
  static func song(start: Int, end: Int) -> String {
    var reply: String = ""
    
    for count in start...end {
      reply += oneVerse(cnt: count) + "\n\n"
    }
    
    return String(reply.dropLast(2))
  }
}
