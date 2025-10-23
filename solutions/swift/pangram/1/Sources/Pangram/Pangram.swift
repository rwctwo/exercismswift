import Foundation

//Approach 1: Using a Set makes this exercise Easy
func isPangram(_ text: String) -> Bool {
  let alphabet: Set<Character> = Set("abcdefghijklmnopqrstuvwxyz")
  let textSet: Set<Character> = Set(text.lowercased())
  
  if !alphabet.isSubset(of: textSet) {
    return false
  }
  
  return true
}
