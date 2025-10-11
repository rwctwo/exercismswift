import Foundation

//Basic exercise reviewing the Swift enum
//Inherits String so the raw values are strings
enum ResistorColor: String, CaseIterable {
  case black, brown, red, orange, yellow, green, blue, violet, grey, white
    
  static func colorCode(for color: String) -> Int {
    guard let index = 
    ResistorColor.allCases.firstIndex(where: { $0.rawValue == color }) else {
      fatalError("Unknown color: \(color)")
    }
    return index
  }
    
  static let colors: [String] =
      ResistorColor.allCases.map{ $0.rawValue } //conventional mapping using $0
  //Could use KeyPath \. with newer Swift as
  // ResistorColor.allCases.map(\ResistorColor.rawValue)
  // or
  // ResistorColor.allCases.map(\.rawValue)
}