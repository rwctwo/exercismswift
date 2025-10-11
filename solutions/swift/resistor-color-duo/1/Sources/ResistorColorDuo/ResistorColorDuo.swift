import Foundation

//Basic exercise reviewing the Swift enum
//Expanding ResistorColor exercise
enum ResistorColorDuo: String, CaseIterable {
  case black, brown, red, orange, yellow, green, blue, violet, grey, white
  
  //Assumption: color has at least two elements
  private static func digit(_ color: String) throws -> String {
    guard let index =
      ResistorColorDuo.allCases.firstIndex(
                          where: { $0.rawValue == color }) else {
      fatalError("Unknown color")
    }
    return String(index)
  }
  
  static func value(for colors: [String]) throws -> Int {
    let digit1 = try digit(colors[0])
    let digit2 = try digit(colors[1])
    
    return Int(digit1 + digit2)!
  }
}