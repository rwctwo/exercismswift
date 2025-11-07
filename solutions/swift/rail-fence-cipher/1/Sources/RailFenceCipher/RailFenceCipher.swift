//Rail Fence Cipher
import Foundation

//Assume the input text is well formed. No input checking.
func encode(_ text: String, rails: Int) -> String {
  let colSize = text.count
  let rowSize = rails
  let cycle = 2 * (rails - 1)
  
  var grid : [[Character]] = (0..<rowSize).map { _ in Array(repeating: ".", count: colSize) }
  var encoded: String = ""
  
//  var text = text.replacingOccurrences(of: " ", with: "")
  for (idx, char) in text.enumerated() {
    let col = idx
    let rem = idx % cycle
    let row = rem < rails ? rem : cycle - rem
    grid[row][col] = char
  }
  
  for row in grid {
    encoded.append(contentsOf: row.filter{ $0.isLetter || $0.isNumber })
  }
  
  return encoded
}

func decode(_ text: String, rails: Int) -> String {
  let colSize = text.count
  let rowSize = rails
  let cycle = 2 * (rails - 1)
  
  var grid : [[Character]] = (0..<rowSize).map { _ in Array(repeating: ".", count: colSize) }
  var decoded: String = ""
  
  for idx in 0..<text.count { //create grid with ? marks in zig-zag
    let col = idx
    let rem = idx % cycle
    let row = rem < rails ? rem : cycle - rem
    grid[row][col] = "?"
  }
  
  let text = Array(text)
  var idx = 0
  for row in 0..<rowSize { //replace ? marks with text characters row by row
    for col in 0..<colSize {
      if grid[row][col] == "?" {
        grid[row][col] = text[idx]
        idx += 1
      }
    }
  }
  
  for idx in 0..<text.count { //pick up letters/numbers from grid in zig-zag
    let col = idx
    let rem = idx % cycle
    let row = rem < rails ? rem : cycle - rem
    decoded.append(grid[row][col])
  }
  
  return decoded
}