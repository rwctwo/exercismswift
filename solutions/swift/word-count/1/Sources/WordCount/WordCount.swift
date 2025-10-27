import Foundation

//Version 1: Using CharacterSet for handling single quote '
//Since we are allowing a quote as a part of word to
//include can't, won't, don't, etc, we have to add code
//to remove single quotes at the beginning  or the end of
//a word or single quotes all by itself
class WordCount {
  private var wordCount: [String: Int] = [:]
  
  private static func removeSingleQuotes(word: String) -> String {
    print(word)
    var s = word
    if let first = s.first, let last = s.last, first == "'", last == "'", s.count >= 2 {
      s = String(s.dropFirst().dropLast())
    }
    if s.first == "'" { s = String(s.dropFirst()) }
    if s.last == "'"  { s = String(s.dropLast()) }
    return s
  }
  
  init(words: String) {
    var allowed = CharacterSet.alphanumerics
    allowed.insert(charactersIn: "'") //allow ' as a part of a word
    
    let tokens = words
      .lowercased()
      .components(separatedBy: allowed.inverted)
      .map(WordCount.removeSingleQuotes)
      .filter { !$0.isEmpty }
    
    for word in tokens {
      wordCount[word, default: 0] += 1
    }
  }
  
  func count() -> [String: Int] { wordCount }
}
