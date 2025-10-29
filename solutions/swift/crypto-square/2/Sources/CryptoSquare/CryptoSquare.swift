import Foundation

//Version 2: Improved one directly working on an array of Character, 
//converting to a String and slicing at the intermediate steps
func cryptoSquare(text: String) -> String {
  // Normalize to lowercase alphanumerics only
  let normalized = text
    .lowercased()
    .components(separatedBy: CharacterSet.alphanumerics.inverted)
    .joined()
  if normalized.isEmpty { return "" }

  // Work entirely with Character arrays
  let chars: [Character] = Array(normalized)
  let n = chars.count

  // Compute rows and cols
  let root = sqrt(Double(n))
  var rows = Int(floor(root))
  var cols = Int(ceil(Double(n) / Double(rows)))
  if cols - rows > 1 {
    rows += 1
    cols = Int(ceil(Double(n) / Double(rows)))
  }

  // Build padded rows as [[Character]]
  var grid: [[Character]] = []
  grid.reserveCapacity(rows)
  var i = 0
  while i < n {
    let end = min(i + cols, n)
    var row = Array(chars[i..<end])
    if row.count < cols {
      row.append(contentsOf: Array(repeating: Character(" "), count: cols - row.count))
    }
    grid.append(row)
    i = end
  }

  // Read column-wise into a Character array
  var encrypted: [Character] = []
  encrypted.reserveCapacity(rows * cols)
  for c in 0..<cols {
    for r in 0..<rows {
      encrypted.append(grid[r][c])
    }
  }

  // Chunk into length `rows` and join with spaces
  var resultParts: [String] = []
  var j = 0
  while j < encrypted.count {
    let end = min(j + rows, encrypted.count)
    let chunk = String(encrypted[j..<end])
    resultParts.append(chunk)
    j = end
  }

  return resultParts.joined(separator: " ")
}