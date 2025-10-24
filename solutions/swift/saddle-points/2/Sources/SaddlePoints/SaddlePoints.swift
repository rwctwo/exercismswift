//Version 2: 
/* 
Since the use of a Set conflicts with the way the Position struct is pre-defined by the system,
this version avoids the use of a Set. Instead, we will use two arrays rowMax and colMin that hold
the maximum value for each row and the minimum value for each column, respectively. Then, we
visit each element of a grid (r, c) and add it to the solution if the value equals rowMax[r] and
colMin(c)
*/

struct SaddlePoints {
  
  private static func transposed(_ matrix: [[Int]]) -> [[Int]] {
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
  
  private static func rowsMax(_ rows: [[Int]]) -> [Int] {
    return rows.map{ $0.max()!}
  }
  
  private static func colsMin(_ rows: [[Int]]) -> [Int] {
    return transposed(rows).map{ $0.min()! }
  }
  
  static func saddlePoints(_ rows: [[Int]]) -> [Position] {
    let rowsMaxValues = rowsMax(rows)
    let colsMinValues = colsMin(rows)
    
    var saddlePoints: [Position] = []
    
    for (i, row) in rows.enumerated() {
      for (j, value) in row.enumerated() {
        if value == rowsMaxValues[i] && value == colsMinValues[j] {
          saddlePoints.append(Position(row: i+1, column: j+1)) //convert to base-1
        }
      }
    }
    
    return saddlePoints
  }
}