enum QueenError: Error {
  case inValidRow
  case inValidColumn
}

class Queen {
  let row: Int
  let column: Int
  
  init(row: Int, column: Int) throws {
    if row < 0 || row > 7 {
      throw QueenError.inValidRow
      
    } else if column < 0 || column > 7 {
      throw QueenError.inValidColumn
      
    } else {
      self.row = row
      self.column = column
    }
  }
  
  func canAttack(other: Queen) -> Bool {
    return row == other.row || column == other.column ||      //same row or column
           abs(row - other.row) == abs(column - other.column) //diagonal or cross diagonal
  }
}
