func timeToPrepare(drinks: [String]) -> Double {
  // fatalError("Please implement the timeToPrepare(drinks:) function")
      var totalTime: Double = 0.0
    for drink in drinks {
        switch drink {
        case "beer", "soda", "water":
            totalTime += 0.5
        case "shot":
            totalTime += 1.0
        case "mixed drink":
            totalTime += 1.5
        case "fancy drink":
            totalTime += 2.5
        case "frozen drink":
            totalTime += 3.0
        default:
            break
        }
    }
    return totalTime
}

func makeWedges(needed: Int, limes: [String]) -> Int {
  // fatalError("Please implement the makeWedges(needed:limes:) function")
  var limesCnt = 0
  var cnt = 0
  for lime in limes {
    if limesCnt >= needed { break } //test first, in case needed == 0
    cnt += 1
    switch (lime) {
      case "small":
        limesCnt += 6
      case "medium":
        limesCnt += 8
      case "large":
        limesCnt += 10
      default:
        cnt -= 1
    }
  }
  return cnt
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
  // fatalError("Please implement the finishShift(minutesLeft:remainingOrders:) function")
    var timeLeft = Double(minutesLeft)
    var orders = remainingOrders
    
    while timeLeft > 0 {
      if orders == [] { break } //still time left but no more orders to process
      let element = orders.removeFirst()
      timeLeft -= timeToPrepare(drinks: element)
    }
    
    return orders
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
    beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
) {
    // fatalError("Please implement the orderTracker(orders:) function")
    var beerStat: (first: String, last: String, total: Int)?
    var sodaStat: (first: String, last: String, total: Int)?
    
    for (drink, time) in orders {
        switch (drink, time) {
        case ("beer",  let t):
            if var stat = beerStat {
                if t < stat.first { stat.first = t }
                if t > stat.last  { stat.last  = t }
                stat.total += 1
                beerStat = stat
            } else {
                beerStat = (first: t, last: t, total: 1)
            }
        case ("soda", let t):
            if var stat = sodaStat {
                if t < stat.first { stat.first = t }
                if t > stat.last  { stat.last  = t }
                stat.total += 1
                sodaStat = stat
            } else {
                sodaStat = (first: t, last: t, total: 1)
            }
        default:
            continue
        }
    }
    
    return (beer: beerStat, soda: sodaStat)
}
