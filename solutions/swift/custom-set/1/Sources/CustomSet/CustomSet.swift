struct CustomSet<T: Hashable> {
  private var dict: [T: Bool] = [:]
  
  var isEmpty : Bool {
    dict.count == 0
  }
  
  init (_ array: [T]) {
    for element in array {
      dict[element, default: true] = true
    }
  }

  mutating func add(_ element: T) {
    dict[element, default: true] = true
  }
  
  func contains(_ element: T) -> Bool {
    dict[element] ?? false
  }
  
  func isSubset(of set2: CustomSet<T>) -> Bool {
    !dict.contains(where: { !set2.dict.keys.contains($0.key) })
  }
  
  static func == (lhs: CustomSet<T>, rhs: CustomSet<T>) -> Bool {
    lhs.isSubset(of: rhs) && rhs.isSubset(of: lhs)
  }
  
  func isDisjoint(with set2: CustomSet<T>) -> Bool {
    !dict.contains(where: { set2.dict.keys.contains($0.key) })
  }
  
  func intersection(_ set2: CustomSet<T>) -> CustomSet<T> {
    var result = CustomSet<T>([])
    var (set1, set2) = self.dict.count < set2.dict.count ? (self, set2) : (set2, self)
    
    for (key, _) in set1.dict {
      if let val = set2.dict[key] {
        result.dict[key] = true
      }
    }
    
    return result
  }
  
  func union(_ set2: CustomSet<T>) -> CustomSet<T> {
    var (result, theOther) = self.dict.count < set2.dict.count ? (set2, self) : (self, set2)
    
    for (key, _) in theOther.dict {
      if result.dict[key] == nil {
        result.dict[key] = true
      }
    }
    
    return result
  }
  
  func difference(_ set2: CustomSet<T>) -> CustomSet<T> {
    var result = self
    
    for (key, _) in set2.dict {
      if result.dict[key] != nil {
        result.dict[key] = nil
      }
    }
    
    return result
  }
}

