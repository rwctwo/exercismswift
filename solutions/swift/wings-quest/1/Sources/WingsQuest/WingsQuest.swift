func bonusPoints(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  // fatalError("Please implement the bonusPoints(powerUpActive:touchingEagle:) function")
  return powerUpActive && touchingEagle
}

func score(touchingPowerUp: Bool, touchingSeed: Bool) -> Bool {
  // fatalError("Please implement the score(touchingPowerUp:touchingSeed:) function")
  return touchingPowerUp || touchingSeed
}

func lose(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  // fatalError("Please implement the lose(powerUpActive:touchingEagle:) function")
  return touchingEagle && !powerUpActive
}

func win(hasPickedUpAllSeeds: Bool, powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  return hasPickedUpAllSeeds && !lose(powerUpActive: powerUpActive, touchingEagle: touchingEagle)
}
