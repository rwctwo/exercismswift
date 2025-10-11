func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
  // fatalError("Please implement the canIBuy(vehicle:price:monthlyBudget:) function")
  let payment = price / 60

  if payment <= monthlyBudget {
    return "Yes! I'm getting a \(vehicle)"
  } else if payment <= monthlyBudget * 1.1 {
    return "I'll have to be frugal if I want a \(vehicle)"
  } else {
    return "Darn! No \(vehicle) for me"
  }
}

func licenseType(numberOfWheels wheels: Int) -> String {
  // fatalError("Please implement licenseType(numberOfWheels:) function")
  
  if wheels == 2 || wheels == 3 {
    return "You will need a motorcycle license for your vehicle"
  } else if wheels == 4 || wheels == 6 {
    return "You will need an automobile license for your vehicle"
  } else if wheels == 18 {
    return "You will need a commercial trucking license for your vehicle"
  } else {
    return "We do not issue licenses for those types of vehicles"
  }
}

func calculateResellPrice(originalPrice: Int, yearsOld: Int) -> Int {
  // fatalError("Please implement calculateResellPrice(originalPrice:yearsOld:) function")

  let price = Double(originalPrice)
  if yearsOld < 3 {
    return Int(price * 0.8)
  } else if yearsOld < 10 {
    return Int(price * 0.7)
  } else {
    return Int(price * 0.5)
  }
  
}
