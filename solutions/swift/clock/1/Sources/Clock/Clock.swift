import Foundation

//VERSION 1: 
//Brute force with no classes or structs
//from any packages
//Code is a bit long but provides detail logic
//on adjusting hours and minutes
struct Clock: Equatable {
  private var hours: Int
  private var minutes: Int
  
  var description: String {
    String(format: "%02d", hours == 24 ? 0 : hours) + ":" + String(format: "%02d", minutes)
  }
  
  static func ==(lhs: Clock, rhs: Clock) -> Bool{
    lhs.hours == rhs.hours && lhs.minutes == rhs.minutes
  }
  
  init(hours: Int, minutes: Int) {
    self.hours = hours < 0 ?
                      24 + (hours % 24) :
                      hours % 24
    
    let hourInc = minutes / 60 % 24
    self.hours += hourInc
    
    let minInc = minutes % 60
    
    if minInc >= 0 {
      self.minutes = minInc
      
    } else{
      self.minutes = minInc + 60
      self.hours -= 1
      if self.hours < 0 {
        self.hours += 24
      }
    }
  }
  
  func add(minutes: Int) -> Clock {
    let hourInc = minutes / 60 % 24
    var newHrs = self.hours + hourInc
    
    let minInc = minutes % 60
    
    var newMins: Int
    if minInc >= 0 {
      newMins = self.minutes + minInc
      
    } else{
      newMins = self.minutes + minInc + 60
      newHrs -= 1
      if newHrs < 0 {
        newHrs += 24
      }
    }
    
    return Clock(hours: newHrs, minutes: newMins)
  }
  
  func subtract(minutes: Int) -> Clock {
    add(minutes: -minutes)
  }
}
