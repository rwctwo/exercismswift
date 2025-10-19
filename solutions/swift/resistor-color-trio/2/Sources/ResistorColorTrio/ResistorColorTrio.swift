import Foundation

//Version 2:
//Convert to a String and then process this string to count
//the number of "000". This simplifies the 'magnitude' array
//and eliminates the special handling for 1000, 2000, ... , 9000 in
//Version 1
enum ResistorColorTrio: String, CaseIterable {
  case black, brown, red, orange, yellow, green, blue, violet, grey, white
  
  private static let magnitude: [String] = ["ohms", "kiloohms", "megaohms", "gigaohms"]
  
  //Assumption: color has at least two elements
  private static func digit(_ color: String) throws -> Int {
    guard let index =
      ResistorColorTrio.allCases.firstIndex(
        where: { $0.rawValue == color }) else { fatalError("Unknown color")}
    
    return index
  }
  
  static func label(for colors: [String]) throws -> String {
    let digit1 = try digit(colors[0])
    let digit2 = try digit(colors[1])
    let digit3 = try digit(colors[2])
    
    let number = (digit1 * 10 + digit2) * Int(truncating: pow(10, digit3) as NSDecimalNumber)
    
    var numStr = String(number)
    var cnt = 0
    while (numStr.count > 3) {
      numStr = String(numStr.dropLast(3))
      cnt += 1
    }
    
    return "\(numStr) \(magnitude[cnt])"
  }
}