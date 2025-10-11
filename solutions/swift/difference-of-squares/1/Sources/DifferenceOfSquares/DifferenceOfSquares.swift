class Squares {
  // Write your code for the 'Difference Of Squares' exercise here.
  var N: Int

  init(_ size: Int) {
    N = size
  }

  var squareOfSum: Int {
    //  var sum = 0
    //  for i in 1...N {
    //     sum += i
    //  }
    let sum = (N * (N + 1)) / 2
    return sum * sum
  }

  var sumOfSquares: Int {
    // var sqSum = 0
    // for i in 1...N {
    //   sqSum += i * i
    // }
    /*
    Don't write N * (N + 1) * (2 * N + 1) // 6
    Unlike Python, integer division is / in Swift
    Anything after // is a comment so there won't be any error. It
    will be interpreted simply as N * (N + 1) * (2 * N + 1)
    */
    let sqSum = N * (N + 1) * (2 * N + 1) / 6
    return sqSum
  }  

  var differenceOfSquares: Int {
    return squareOfSum - sumOfSquares
  }
}
