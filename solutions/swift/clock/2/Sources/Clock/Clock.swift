import Foundation

import Foundation

//VERSION 2:
//Brute force with no classes or structs
//from any packages
//Improved version. The idea is to convert
//the provided hours and minutes into a positive total in
//minutes, so the hours and minutes can be computed
//easily with / and %
struct Clock: Equatable {
    
  let hours: Int
  let minutes: Int
  let dayTotalMinutes = 24 * 60
  
  var description: String {
    String(format: "%02d", hours == 24 ? 0 : hours) + ":" + String(format: "%02d", minutes)
  }
  
  static func ==(lhs: Clock, rhs: Clock) -> Bool{
    lhs.hours == rhs.hours && lhs.minutes == rhs.minutes
  }
  
  init(hours: Int, minutes: Int) {
    //Expression (hours * 60 + minutes) % dayTotalMinutes
    //could be negative or positive, but by adding dayTotalMinutes it becomes
    //positive. If it is positive, adding dayTotalMinutes make it larger but
    //we're taking its mod by dayTotalMinutes so it will result the same
    let total = ((hours * 60 + minutes) % dayTotalMinutes + dayTotalMinutes) % dayTotalMinutes
    self.hours = total / 60
    self.minutes = total % 60
  }
  
  func add(minutes delta: Int) -> Clock {
    let total = ((hours * 60 + minutes) + delta) % dayTotalMinutes
    let normalized = total >= 0 ? total : total + dayTotalMinutes
    let newHours = (normalized / 60) % 24
    let newMinutes = normalized % 60
    return Clock(hours: newHours, minutes: newMinutes)
  }
  
  func subtract(minutes: Int) -> Clock {
    add(minutes: -minutes)
  }
}