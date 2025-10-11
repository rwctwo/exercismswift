import Foundation

func isIsogram(_ string: String) -> Bool {
  let str = string
              .replacingOccurrences(of: " ", with: "")
              .replacingOccurrences(of: "-", with: "")
              .lowercased()
    
  //Using a set
  let set = Set(str)

  if set.count != str.count {
    return false
  } else {
    return true
  }
    
  //Using a dictionary
  // var dict = [Character : Int]()
  // for ch in str {
  //   if dict[ch] == nil {
  //     dict[ch] = 1
  //   } else {
  //     return false
  //   }
  // }
  // return true
}
