struct Matrix {

  //these two must be public for the subscript access
  //such as matrix.columns[3] to work
  let rows: [[Int]]
  let columns: [[Int]]
  
  //Assumption: Input matrix is well-formed N x N matrix
  init (_ matrix: String) {
    //pre-build both rows and cols so we don't have
    //to compute the cols repeatedly
    if matrix.isEmpty {
      rows = []
      columns = []
    } else {
      rows = matrix
        .split(separator: "\n", omittingEmptySubsequences: true)
        .map {
            $0.split(separator: " ", omittingEmptySubsequences: true)
              .map { Int($0)! }
        }
      
      var transposed: [[Int]] = Array(repeating: [], count: rows[0].count)
      for row in rows {
        for (i, e) in row.enumerated() {
          transposed[i].append(e)
        }
      }
      columns = transposed
    }
  }
      
  func rows(_ index: Int) -> [Int] { rows[index] }
  func columns(_ index: Int) -> [Int] { columns[index] }
  
  subscript(rows index: Int) -> [Int] { rows[index] }
  subscript(columns index: Int) -> [Int] { columns[index] }
}