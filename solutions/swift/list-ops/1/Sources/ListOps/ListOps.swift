//Solution goes in Sources

import Foundation

struct ListOps {
    
  static func append<T>(_ a: [T], _ b: [T]) -> [T] {
    return a + b
  }

  static func concat<T>(_ listOfLists: [[T]]) -> [T] {
    var result: [T] = []

    for list in listOfLists {
      result += list
    }

    return result
  }

  static func filter<T>(_ list: [T], _ predicate: (T) -> Bool) -> [T] {
    var result: [T] = []

    for item in list {
      if predicate(item) {
        result += [item]
      }
    }

    return result
  }

  static func length<T>(_ list: [T]) -> Int {
    //result list.count //if allowed

    var result = 0

    for _ in list {
      result += 1
    }

    return result
  }

  static func map<T, W>(_ list: [T], _ transform: (T) -> W) -> [W] {
    var result: [W] = []

    for item in list {
      result += [transform(item)]
    }

    return result
  }

  static func foldLeft<T, U>(_ list: [T], accumulated: U, _ combine: (T, U) -> U) -> U {

    var result: U = accumulated

    for item in list {
      result = combine(item, result)
      //this is how I need to implement to 
      //pass the defined tests, but this implementation
      //is not equivalent to [1,2,3,4].reduce(24, /)
      //It should be combine(result, item)
    }

    return result
  }

  static func foldRight<T, U>(_ list: [T], accumulated: U, _ combine: (T, U) -> U) -> U {

    var result: U = accumulated

    for item in ListOps.reverse(list) {
      result = combine(item, result)
      //See note for foldLeft
    }

    return result
  }


  static func reverse<T>(_ list: [T]) -> [T] {
    var result: [T] = []

    for item in list {
      result = [item] + result
    }

    return result
  }
}
