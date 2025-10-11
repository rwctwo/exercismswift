class ETL {
  static func transform(_ old: [String: [String]]) -> [String: Int] {
    //Assumption: Paremter 'old' is well formed with no error data
    
    //Basic nested-loop approach
    /*
    var newDict = [String: Int]()
    for (key, list) in old {
      let val = Int(key)
      for letter in list {
        newDict[letter.lowercased()] = val
      }
    }
    return newDict
    */
    
    //Functional approach
    return
      old.reduce(into: [String:Int]()) { (acc, element) in
        let (key, list) = element
        let val = Int(key)
        list.forEach({ acc[$0.lowercased()] = val })
      }
    
  }
}
