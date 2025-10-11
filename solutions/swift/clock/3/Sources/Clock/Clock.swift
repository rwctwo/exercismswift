import Foundation

//VERSION 3:
//Use the framework DateComponents, Calendar, and Date
//DateComponents constructor will handle the negative and 
//positive values for hours and minutes.
struct Clock: Equatable {
  let hours: Int
  let minutes: Int
  
  var description: String {
    String(format: "%02d", hours == 24 ? 0 : hours) + ":" + String(format: "%02d", minutes)
  }
  
  static func ==(lhs: Clock, rhs: Clock) -> Bool{
    lhs.hours == rhs.hours && lhs.minutes == rhs.minutes
  }
  
  init(hours: Int, minutes: Int) {
    let components = DateComponents(hour: hours, minute: minutes)
    let date = Calendar.current.date(from: components)!
    
    self.hours = Calendar.current.component(.hour, from: date)
    self.minutes = Calendar.current.component(.minute, from: date)
  }
  
  func add(minutes: Int) -> Clock {
    .init(hours: self.hours, minutes: self.minutes + minutes)
  }
  
  func subtract(minutes: Int) -> Clock {
    add(minutes: -minutes)
  }
}