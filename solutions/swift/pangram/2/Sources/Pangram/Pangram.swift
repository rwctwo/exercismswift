import Foundation

//Approach 2: Using a Dictionary with keys 'a'...'z' with value being
//the frequency of that letter appearing in the text
func isPangram(_ text: String) -> Bool {
  var letterCnt: [Character: Int] = Dictionary(uniqueKeysWithValues: "abcdefghijklmnopqrstuvwxyz".map { ($0, 0) })
 
  for char in text.lowercased() {
    if let cnt = letterCnt[char] {
      letterCnt[char] = cnt + 1
    }
  }
  
  for (_, cnt) in letterCnt where cnt == 0 {
    return false
  }
  
  return true
}
