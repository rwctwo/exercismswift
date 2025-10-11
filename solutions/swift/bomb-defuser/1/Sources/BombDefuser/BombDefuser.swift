typealias ChangeClosure = @Sendable ((String, String, String)) -> (String, String, String)

//let flip: ChangeClosure = TODO: Please define the flip closure
//
let flip: ChangeClosure = {
  (tuple: (String, String, String)) -> (String, String, String) in
  let (a, b, c) = tuple
  return (b, a, c)
}
//
//let rotate: ChangeClosure = TODO: Please define the rotate closure
let rotate: ChangeClosure = {
    (tuple: (String, String, String)) -> (String, String, String) in
  let (a, b, c) = tuple
  return (b, c, a)
}

/*
NOTE: This code
let rotate = {
    (a: String, b: String, c: String) -> (String, String, String) in
    (b, c, a)
}
worked in Playground. But when tested here, I got Incorrect destructuring
error.
*/

func makeShuffle(
  flipper: @escaping ((String, String, String)) -> (String, String, String),
  rotator: @escaping ((String, String, String)) -> (String, String, String)
) -> ([UInt8], (String, String, String)) -> (String, String, String) {
  // fatalError("Please implement the makeShuffle(flipper:rotator:) function")

  {(id: [UInt8], code: (String, String, String)) -> (String, String, String) in
   var result = code
   for bit in id.reversed() {
     if bit == 0 {
       result = flipper(result)
     } else {
       result = rotator(result)
     }
   }
   return result 
  }
}
