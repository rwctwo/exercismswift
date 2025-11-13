//Conway's Game of Life
//Return one generation from grid
func tick(_ grid: [[Int]]) -> [[Int]] {
  let alive = 1
  let dead = 0
  //---------------------
  //How many neighbors of grid[row][col] are alive
  func liveNeighborCnt(_ row: Int, _ col: Int) -> Int {
    var cnt = 0
    for r in max(0, row-1)...min(grid.count-1, row+1) {
      for c in max(0, col-1)...min(grid[0].count-1, col+1) {
        if grid[r][c] == alive {
          cnt += 1
        }
      }
    }
    if grid[row][col] == alive { cnt -= 1 } //don't count itself in the count
    
    return cnt
  }
  //----------------------
  
  if grid == [] { return [] }
  
  var nextGrid: [[Int]] = []
  nextGrid = Array(repeating: Array(repeating: dead, count: grid[0].count), count: grid.count)
  
  for row in 0..<grid.count {
    for col in 0..<grid[0].count {
      let liveNeighborsCount = liveNeighborCnt(row, col)
      
      if grid[row][col] == alive {
        //live cells die when < 2 or > 3 neighbors are alive, otherwise remain alive
        if liveNeighborsCount < 2 || liveNeighborsCount > 3 {
          nextGrid[row][col] = dead
        } else {
          nextGrid[row][col] = alive
        }
        
      } else { //dead cells become alive only when exactly 3 neighbors are alive
        if liveNeighborsCount == 3 {
          nextGrid[row][col] = alive
        }
      }
    }
  }
  return nextGrid
}

