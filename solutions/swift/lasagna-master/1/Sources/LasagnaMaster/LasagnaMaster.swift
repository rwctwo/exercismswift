// TODO: define the 'remainingMinutesInOven' function
func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
  return expectedMinutesInOven - elapsedMinutes
}

// TODO: define the 'preparationTimeInMinutes' function
func preparationTimeInMinutes(layers: String...) -> Int {
  return layers.count * 2
}

// TODO: define the 'quantities' function
func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
  var noodlesCnt = 0
  var sauceCnt = 0.0
  for layer in layers {
    if layer == "noodles" {
      noodlesCnt += 3
    } else if layer == "sauce" {
      sauceCnt += 0.2
    }
  }
  return (noodles: noodlesCnt, sauce: sauceCnt)
}

// TODO: define the 'toOz' function
func toOz(_ amount: inout (noodles: Int, sauce: Double)) {
  amount.sauce *= 33.814
}

// TODO: define the 'redWine' function
func redWine(layers: String...) -> Bool {
  func ingredient(_ name: String) -> Int {
    var cnt: Int = 0
    for layer in layers {
      if layer == name {
        cnt += 1
      }
    }
    return cnt
  }

  let cheeseCnt = ingredient("mozzarella") + ingredient("ricotta") + ingredient("béchamel")
  let meatAndsauceCnt = ingredient("meat") + ingredient("sauce")

  if cheeseCnt <= meatAndsauceCnt {
    return true
  } else {
    return false
  }
}
