//A review question on how to use a dictionary in Swift
class GradeSchool {
  private var _roster: [String : [String]] = [:]
    
  func addStudent(_ name: String, grade: Int) -> Bool {
    let gradeString = String(grade)
 
    //Name already in the roster
    if _roster.values.contains(where: { $0.contains(name) }) {
      return false
    }
    
    if let group = _roster[gradeString] {
      if !group.contains(name) {
        _roster[gradeString] = group + [name]
      } else {
        return false
      }
    } else {
      _roster[gradeString] = [name]
    }
    return true
  }

  func studentsInGrade(_ grade: Int) -> [String] {
    let gradeList =  _roster[String(grade)] ?? []
    return gradeList.sorted()
  }

  func roster() -> [String] {
    return _roster
    .sorted{ $0.key < $1.key } //sort by grade
    .flatMap { $0.value.sorted() } //sort names within grade

    //Note: Need flatMap so we get one level array.
    //Simple map will return an array of arrays
    //If we a map, then we have
    //        return Array(_roster
    //                    .sorted{ $0.key < $1.key }
    //                    .map { $0.value.sorted() }.joined())
  }  
}
