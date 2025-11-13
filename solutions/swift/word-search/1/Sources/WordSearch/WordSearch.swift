func search(words: [String], in grid: [String]) -> [String: WordLocation?] {
  var wordLocations: [String: WordLocation?] = [:]
  
  let matrix = grid.map { Array($0) }
  let numRows = matrix.count
  let numCols = matrix.first?.count ?? 0
  
  // 8 possible directions: (dr, dc)
  let directions: [(dr: Int, dc: Int)] = [
    (0, 1),   // right
    (0, -1),  // left
    (1, 0),   // down
    (-1, 0),  // up
    (1, 1),   // down-right
    (1, -1),  // down-left
    (-1, 1),  // up-right
    (-1, -1)  // up-left
  ]
  
  func inBounds(_ r: Int, _ c: Int) -> Bool {
    return r >= 0 && r < numRows && c >= 0 && c < numCols
  }
  
  func matches(word: [Character], from r0: Int, _ c0: Int, dir: (dr: Int, dc: Int)) -> WordLocation? {
    var r = r0
    var c = c0
    
    for i in 0..<word.count {
      if !inBounds(r, c) || matrix[r][c] != word[i] {
        return nil
      }
      r += dir.dr
      c += dir.dc
    }
    
    // Step back one to get the end location of the last matched character
    let endRow = r - dir.dr
    let endCol = c - dir.dc
    
    return WordLocation(
      start: WordLocation.Location(row: r0 + 1, column: c0 + 1), //convert to 1-based
      end: WordLocation.Location(row: endRow + 1, column: endCol + 1)
    )
  }
  
  for w in words {
    let chars = Array(w)
    var found: WordLocation? = nil
    
    outer: for r in 0..<numRows {
      for c in 0..<numCols {
        if matrix[r][c] != chars.first { continue }
        for dir in directions {
          if let loc = matches(word: chars, from: r, c, dir: dir) {
            found = loc
            break outer
          }
        }
      }
    }
    
    if found != nil { wordLocations[w] = found }
  }
  
  return wordLocations
}