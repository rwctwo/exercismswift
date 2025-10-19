import Foundation

//Basic exercise reviewing the Swift enum
//Expanding ResistorColorDuo exercise
enum ResistorColorTrio: String, CaseIterable {
  case black, brown, red, orange, yellow, green, blue, violet, grey, white
  
  private static var magnitude: [(name: String, value: Int)] {
    [(" ohms", 1), (" kiloohms", 1000), (" megaohms", 1_000_000), (" gigaohms", 1_000_000_000)]
  }
  
  //Assumption: color has at least two elements
  private static func digit(_ color: String) throws -> Double {
    guard let index =
      ResistorColorTrio.allCases.firstIndex(
        where: { $0.rawValue == color }) else { fatalError("Unknown color")}
    
    return Double(index)
  }
  
  static func label(for colors: [String]) throws -> String {
    let digit1 = try digit(colors[0])
    let digit2 = try digit(colors[1])
    let digit3 = try digit(colors[2])
    
    let number = Int((digit1 * 10 + digit2) * pow(10, digit3))
    let index =  Int(digit3 / 3)
    
    var num: String
    var unit: String
    
    if digit3 == 2 && digit2 == 0 { //special cases 1000, 2000, 3000, ... , 9000
      num = String(Int(digit1))
      unit = ResistorColorTrio.magnitude[1].name
    } else {
      num = String(number / ResistorColorTrio.magnitude[index].value) //eg "650"
      unit = ResistorColorTrio.magnitude[index].name //eg " kilograms"
    }
    
    return "\(num)\(unit)"
  }
}