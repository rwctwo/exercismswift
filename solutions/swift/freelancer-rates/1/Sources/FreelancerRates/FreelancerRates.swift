func dailyRateFrom(hourlyRate: Int) -> Double {
  // fatalError("Please implement the dailyRateFrom(hourlyRate:) function")
  return Double(hourlyRate) * 8.0
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  // fatalError("Please implement the monthlyRateFrom(hourlyRate:withDiscount:) function")
  return (dailyRateFrom(hourlyRate: hourlyRate) * 22.0 * (100 - discount)/100).rounded(.down)
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  // fatalError("Please implement the workdaysIn(budget:hourlyRate:withDiscount:) function")
  return (budget / (dailyRateFrom(hourlyRate: hourlyRate) * (100 - discount)/100)).rounded(.down)
}
