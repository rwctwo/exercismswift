import Foundation

enum BinarySearchError: Error {
  case valueNotFound
}

class BinarySearch {
  private var _list: [Int]
  
  init(_ sortedArray: [Int]) {
    _list = sortedArray
  }

  // private func rec_index(_ low: Int, _ high: Int, _ value: Int) throws -> Int {
  //   if low > high {
  //     throw BinarySearchError.valueNotFound
  //   }
  //   let mid = low + (high - low) / 2
  //   if _list[mid] == value {
  //     return mid
  //   } else if _list[mid] > value {
  //     return try rec_index(low, mid - 1, value)
  //   } else {
  //     return try rec_index(mid + 1, high, value)
  //   }
  // }
  
   private func index(_ low: Int, _ high: Int, _ value: Int) throws -> Int {
    var low = low
    var high = high
    while low <= high {
      let mid = (high - low) / 2 + low
      if _list[mid] == value {
        return mid
      } else if _list[mid] > value {
        high = mid - 1
      } else {
        low = mid + 1
      }
    }
    throw BinarySearchError.valueNotFound
  }
  
  func searchFor(_ value: Int) throws -> Int {
    return try index(0, _list.count - 1, value)
  }
}
