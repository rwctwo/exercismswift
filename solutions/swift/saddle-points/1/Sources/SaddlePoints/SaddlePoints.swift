//Version 1: 
/* 
Basic Idea - Create a set of locations that has the max value for each row
and a set of locations that has the min value for each column. Return
the intersection of the two sets. First attempted to create my own Position
struct, but this struct is already defined. As it is defined already and does
not support Hashable, I cannot create Set<Position>. So I defined my Location
struct and I converted the solution array of Location to an array of Position.
*/

struct Location: Hashable {
  let row: Int
  let column: Int
  
  //convert base 0 index to base 1 index for Position
  init(row: Int, column: Int) {
    self.row = row + 1
    self.column = column + 1
  }
}

struct SaddlePoints {
  private static func transpose(_ matrix: [[Int]]) -> [[Int]] {
    guard !matrix.isEmpty else { return [] }
    
    let rowCount = matrix.count
    let colCount = matrix[0].count
    var transposed: [[Int]] = Array(repeating: Array(repeating: 0, count: rowCount), count: colCount)
    
    for (i, row) in matrix.enumerated() {
      row.enumerated().forEach { j, value in
        transposed[j][i] = value
      }
    }
    return transposed
  }
  
  private static func rowsMax(_ rows: [[Int]]) -> Set<Location> {
    rows.enumerated().reduce(into: Set<Location>()) { result, arg in
      let (i, row) = arg
      if let maxVal = row.max() { //locate all max value positions
        for (j, val) in row.enumerated() where val == maxVal {
          result.insert(Location(row: i, column: j))
        }
      }
    }
  }
  
  private static func columnsMin(_ cols: [[Int]]) -> Set<Location> {
    cols.enumerated().reduce(into: Set<Location>()) { result, arg in
      let (j, col) = arg
      if let minVal = col.min() {
        for (i, val) in col.enumerated() where val == minVal {
          result.insert(Location(row: i, column: j))
        }
      }
    }
  }
  
  static func saddlePoints(_ rows: [[Int]]) -> [Position] {
    let cols = transpose(rows)
    
    let maxInRows = rowsMax(rows)
    let minInCols = columnsMin(cols)
    
    return Array(maxInRows.intersection(minInCols)).map{ Position(row: $0.row, column: $0.column) }
  }
}