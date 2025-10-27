import Foundation

//Version 2: Using Regex (regular expression)
//Create a regex that matches the pattern for a word that
//could include an apostrophe.
//#"abc"# is a literal spec for pattern to avoid using \
//[a-z]+     == one or more lowercase letters or digits
//('[a-z]+)? == optionally may include a single quote followed
//              one or more lowercase letters or digits
class WordCount {
  private var wordCount: [String: Int] = [:]
  
  init(words: String) {
    let lower = words.lowercased()
    
    let pattern = #"[a-z|0-9]+('[a-z|0-9]+)?"#
    let regex = try! NSRegularExpression(pattern: pattern)
    
    let range = NSRange(lower.startIndex..<lower.endIndex, in: lower)
    for match in regex.matches(in: lower, range: range) {
      if let r = Range(match.range, in: lower) {
        let token = String(lower[r])
        wordCount[token, default: 0] += 1
      }
    }
  }
  
  func count() -> [String: Int] { wordCount }
}
