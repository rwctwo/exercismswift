extension Array {
  func keep(_ predicate: (Element) throws -> Bool) rethrows -> [Element] {
    var result: [Element] = []
    for element in self {
      if try predicate(element) {
        result.append(element)
      }
    }
    return result
  }
  
  func discard(_ predicate: (Element) throws -> Bool) rethrows -> [Element] {
    var result: [Element] = []
    for element in self {
      if try !predicate(element) {
        result.append(element)
      }
    }
    return result
  }
}

