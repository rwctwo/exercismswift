/*
 Version 2: Brute Force Recursive Solution for the 0-1 Knapsack Problem
 
 Solve recursively. Check the items one by one. Either use this item or not,
 and recurse until no more items left.
 */
struct Knapsack {
  
  public static func maximumValue(_ items: [Item], _ capacity: Int) -> Int {
    
    func recursiveKnapsack(_ items: [Item], _ capacity: Int) -> Int {
      var result: Int = 0
      
      if items.isEmpty { return result }
      
      let firstItem = items[0]
      let remainingItems = Array(items.dropFirst())
      
      if firstItem.weight > capacity { //overcapacity already, so can't use the first item
        return recursiveKnapsack(remainingItems, capacity)
        
      } else { //return the max of using vs not using the first item
        return max(firstItem.value
                   + recursiveKnapsack(remainingItems, capacity - firstItem.weight),
                   recursiveKnapsack(remainingItems, capacity))
      }
    }
    
    return recursiveKnapsack(items, capacity)
  }
}