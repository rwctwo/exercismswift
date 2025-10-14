

class Garden {
  enum Plant: Int {
    case grass, clover, radishes, violets
  }
  
  let indexOf: [String:Int] = "Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry"
            .split(separator: " ")
            .enumerated()
            .reduce(into: [:]) { (result, pair) in
              result[String(pair.element)] = pair.offset
            }
  
  let id: [Character: Plant] = 
            ["G" : .grass, 
             "C" : .clover, 
             "R" : .radishes, 
             "V" : .violets]
  
  let plants : (front: [Character], 
                back: [Character])
  
  init (_ str: String) {
    let input = str.split(separator: "\n")
    if input.isEmpty {
      plants = ([], [])
    } else {
      plants = (Array(String(input[0])), Array(String(input[1])))
    }
  }
  
  func plantsForChild(_ name: String) -> [Plant] {
    let kidIndex = indexOf[name] ?? plants.front.count
    
    if 2 * kidIndex <= plants.front.count {
      let first = 2 * kidIndex
      let second = first + 1
      return [id[plants.front[first]]!, id[plants.front[second]]!, 
              id[plants.back[first]]!, id[plants.back[second]]!]   
    } else {
      return []
    }
  }
}
