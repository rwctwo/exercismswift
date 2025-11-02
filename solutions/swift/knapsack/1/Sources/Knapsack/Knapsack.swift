/*
 Version 1: Brute Force Solution for the 0-1 Knapsack Problem
 
 Try all possible 2^N combinations of N items. For each combination
 retain the maximum value found. Use bit-manipulation to keep track
 of whether to include a particular item or not. Eg. given three items,
 we generate 001, 010, ... , 111. 001 means use Item 1, 110 means 
 use Items 3 and 2, and so forth
 */
struct Knapsack {
  public static func maximumValue(_ items: [Item], _ capacity: Int) -> Int {
    let n = items.count
    var maxValue = 0
    
    for i in 1..<(1 << n) {
      var currentWeight = 0
      var currentValue = 0
      
      for j in 0..<n {
        if i & (1 << j) != 0 {
          currentWeight += items[j].weight
          currentValue += items[j].value
        }
      }
      
      if currentWeight <= capacity && currentValue > maxValue {
        maxValue = currentValue
      }
    }
    
    return maxValue
  }
}

