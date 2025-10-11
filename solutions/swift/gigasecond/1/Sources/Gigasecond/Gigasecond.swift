import Foundation

func gigasecond(from: Date) -> Date {
  // Write your code for the 'Gigasecond' exercise in this file.
  let gigasecond = TimeInterval(1_000_000_000) //one thousand million

  return from.addingTimeInterval(gigasecond)
}
