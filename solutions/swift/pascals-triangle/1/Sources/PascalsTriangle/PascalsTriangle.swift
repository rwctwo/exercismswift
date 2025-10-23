func pascalsTriangle(rows: Int) -> [[Int]] {
  if rows < 1 { return [] }
  if rows == 1 { return [[1]] }
  
  var pascal: [[Int]] = [[1]]
  for row in 1..<rows {
    var current: [Int] = [1]
    let prev = pascal[row - 1]
    
    for idx in 1..<row {
      current.append(prev[idx] + prev[idx - 1])
    }
    
    current.append(1)
    pascal.append(current)
  }
  
  return pascal
}
