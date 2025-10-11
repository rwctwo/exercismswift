func totalBirdCount(_ birdsPerDay: [Int]) -> Int {
  // fatalError("Please implement the totalBirdCount(_:) function")
  var total = 0
  for cnt in birdsPerDay {
    total += cnt
  }
  return total
}

func birdsInWeek(_ birdsPerDay: [Int], weekNumber: Int) -> Int {
  // fatalError("Please implement the birdsInWeek(_:weekNumber:) function")
  var total = 0
  for idx in stride(from: (weekNumber-1) * 7, to: weekNumber * 7, by: 1) {
    total += birdsPerDay[idx]
  }
  return total
}

func fixBirdCountLog(_ birdsPerDay: [Int]) -> [Int] {
  // fatalError("Please implement the fixBirdCountLog(_:) function")
  var adjustedArray = birdsPerDay
  for idx in stride(from: 0, to: adjustedArray.count, by: 2) {
    adjustedArray[idx] += 1
  }
  return adjustedArray
}
