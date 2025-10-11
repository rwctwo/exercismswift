func dartScore(x: Double, y: Double) -> Int {
  //Improved Version without taking square root
  //and using swift ... range with switch
  //May not be as clear as the direct approach below
  switch x*x + y*y {
    case ...1:   return 10
    case ...25:  return 5
    case ...100: return 1
    default:     return 0
  }
  
  //Direct (and more descriptive) Approach
  /*
  let r = (x * x + y * y).squareRoot()
    
  if r <= 1 {
    return 10
  } else if r <= 5 {
    return 5
  } else if r <= 10 {
    return 1
  } else {
    return 0
  }
  */
}
