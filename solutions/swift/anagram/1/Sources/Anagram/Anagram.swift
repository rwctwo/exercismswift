class Anagram {
  //Key idea is to build maps (dictionaries) for target and candidate
  //words and compare the respective dictionaries. If they are equal
  //then they are acronyms

  private var targetMap: [Character: Int] = [:]
  private var targetWord: String = ""
  
  private func buildMap(_ word: String) -> [Character: Int] {
    var map: [Character: Int] = [:]
    for char in word.lowercased() {
      map[char, default: 0] += 1
    }
    return map
  }
  
  init(word: String) {
    targetMap = buildMap(word)
    targetWord = word.lowercased()
  }
  
  func match(_ words: [String]) -> [String] {
    var acronyms: [String] = []
    for word in words {
      if targetWord != word.lowercased() && targetMap == buildMap(word) {
        acronyms.append(word)
      }
    }
    return acronyms
  }  
}
