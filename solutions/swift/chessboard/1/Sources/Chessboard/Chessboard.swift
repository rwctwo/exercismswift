// TODO: define the 'ranks' constant
// TODO: define the 'files' constant
let ranks = 1...8
let files = "A"..."H"

func isValidSquare(rank: Int, file: String) -> Bool {
  // fatalError("Please implement the isValidSquare(rank:file:) function")
  return ranks.contains(rank) && files.contains(file)
}

func getRow(_ board : [String], rank: Int) -> [String] {
  // fatalError("Please implement the getRow(_:rank:) function")
  let start = (rank - 1) * ranks.count
  let end = rank * ranks.count - 1
  return Array(board[start...end])
  
}
