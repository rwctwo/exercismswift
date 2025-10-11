import Foundation

enum GrainsError: Error {
  case inputTooHigh
  case inputTooLow
}

struct Grains {

  static let total = (1...64).reduce(UInt64(0)) 
              { $0 + (try! Grains.square($1)) } 
  // static var total: UInt64 { (1...64).reduce(UInt64(0)) 
  //             { $0 + (try! Grains.square($1)) } }
             
  static func square(_ num: Int) throws -> UInt64 {
    if num < 1 { throw GrainsError.inputTooLow }
    if num > 64 { throw GrainsError.inputTooHigh }

    //power of 2 is computed simply by shifting a binary 1
    //to left num-1 times
    return 1 << (num - 1) as UInt64

    //brute force computation
    //return UInt64(pow(2, Double(num - 1)))
  }
  //Alternative is precomputing values and
  //storing them in an array, but in this particular
  //case, each computation (shifting) is not costly
}
