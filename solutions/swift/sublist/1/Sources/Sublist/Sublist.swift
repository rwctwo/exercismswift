 enum ListRelation {
  case equal
  case sublist
  case superlist
  case unequal
}

func classifier(listOne: [Int], listTwo: [Int]) -> ListRelation {
  
  // Is list 'a' a contiguous sublist of 'b' when a.count != b.count
  func isSublist(_ a: [Int], of b: [Int]) -> Bool {
    if a.isEmpty { return true }
    if a.count > b.count { return false } //a is bigger so cannot be a sublist
    // Slide a window of length a.count over b and compare
    for i in 0...(b.count - a.count) {
      if Array(b[i..<(i + a.count)]) == a { return true }
    }
    return false
  }

  if listOne == listTwo { return .equal }
  if isSublist(listOne, of: listTwo) { return .sublist }
  if isSublist(listTwo, of: listOne) { return .superlist }
  return .unequal
}