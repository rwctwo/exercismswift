/*
 Version 3: Optimized Recursive Solution for the 0-1 Knapsack Problem
            using Memoization to avoid repeating the same computation
 
 Solve recursively. At each recursive point, we first
 check a cache entry for that length. If found, we just return the (max) value found in the cache.
 If not, we recurse and the found maximum value is stored in a cache.
 */
struct Knapsack {
  
  public static func maximumValue(_ items: [Item], _ capacity: Int) -> Int {
    if items.isEmpty  { return 0 }
    
    // an array of dictionary; index is the size of items (sub)array
    var cache: [[Int: Int]] = Array(repeating: [:], count: items.count + 1)
    
    func maxValue(_ items: ArraySlice<Item>, _ capacity: Int) -> Int {
      if items.isEmpty { return 0 }
      
      let keyIndex = items.count
      
      if let cached = cache[keyIndex][capacity] { //already computed so return it
        return cached
      }
      
      let firstItem = items[items.startIndex] //ArraySlice: index of first item is not always 0
      let remainingItems = items.dropFirst()
      
      let result: Int
      if firstItem.weight > capacity { //overcapacity already, discard firstItem
        result = maxValue(remainingItems, capacity)
        
      } else {
        result = max(firstItem.value + maxValue(remainingItems, capacity - firstItem.weight),
                     maxValue(remainingItems, capacity))
      }
      
      cache[keyIndex][capacity] = result
      
      return result
    }
    //use ArraySlice so we don't have to recreate a new Array at each recursive points
    return maxValue(items[items.startIndex...], capacity)
  }
}