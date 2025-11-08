func spiralMatrix(size: Int) -> [[Int]] {
  guard size > 0 else { return [] }
  
  var matrix: [[Int]] = (0..<size).map { _ in
    Array(repeating: 0, count: size)
  }
  
  var currentNumber = 1
  var row = 0, col = -1
  let top = 0, bottom = size - 1, left = 0, right = size - 1

  while true {
    
    repeat {    //GO RIGHT
      col += 1
      
      matrix[row][col] = currentNumber
      currentNumber += 1
      
      if currentNumber > size * size { return matrix }
      
    } while col + 1 <= right && matrix[row][col + 1] == 0

    repeat {    //GO DOWN
      row += 1
      
      matrix[row][col] = currentNumber
      currentNumber += 1
      
      if currentNumber > size * size { return matrix }
    
    } while row + 1 <= bottom && matrix[row + 1][col] == 0
    
    repeat {    //GO LEFT
      col -= 1
      
      matrix[row][col] = currentNumber
      currentNumber += 1
      
      if currentNumber > size * size { return matrix }
      
    } while col - 1 >= left && matrix[row][col - 1] == 0
    
    repeat  {   //GO UP
      row -= 1
      
      matrix[row][col] = currentNumber
      currentNumber += 1
      
      if currentNumber > size * size { return matrix }

    } while row - 1 >= top && matrix[row - 1][col] == 0
  }
}