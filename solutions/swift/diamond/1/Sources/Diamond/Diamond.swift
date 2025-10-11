class Diamond {
  static let base: UInt8 = 65 // ASCII 'A'
  static let blank: Character = " "
  
  static func makeDiamond(letter: Character) -> [String] {
    // Ensure we have an uppercase ASCII letter
    guard let ascii = letter.asciiValue, ascii >= Self.base else { return [] }
    
    let bound = Int(ascii - Self.base) + 1 // 'A' -> 1, 'B' -> 2, etc.
    var diamond: [String] = []
    
    // Build top half
    let midIndex = bound - 1
    for i in 0..<bound {
      var row = Array(repeating: Self.blank, count: 2 * bound - 1)
      let ch = Character(UnicodeScalar(Int(Self.base) + i)!)
      
      row[midIndex + i] = ch
      row[midIndex - i] = ch
      
      diamond.append(String(row))
    }
    
    // Build bottom half by mirroring top half (excluding the middle row)
    for i in stride(from: bound - 2, through: 0, by: -1) {
      diamond.append(diamond[i])
    }
    
    return diamond
  }
}
