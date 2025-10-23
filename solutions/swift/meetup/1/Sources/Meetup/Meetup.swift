import Foundation

//No input error checking is done. Assume all arguments
//passed to the constructor are valid
class Meetup {
   static let weekDays = [
    "",
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ]
  
   static let daysOfWeek: [String: [Int]] = [
    "first": [1, 2, 3, 4, 5, 6, 7],
    "second": [8, 9, 10, 11, 12, 13, 14],
    "third": [15, 16, 17, 18, 19, 20, 21],
    "fourth": [22, 23, 24, 25, 26, 27, 28],
    "last": [25, 26, 27, 28, 29, 30, 31],
    "teenth": [13, 14, 15, 16, 17, 18, 19],
    "leapfeblast": [23, 24, 25, 26, 27, 28, 29],
    "nonleapfeblast": [22, 23, 24, 25, 26, 27, 28]
  ]

  let description: String
  
  init(year: Int, month: Int, week: String, weekday: String) {
    description = Meetup.getMeetupDate(year: year, month: month, week: week, weekday: weekday)
  }
  
  private static func getMeetupDate(year: Int, month: Int, week: String, weekday: String) -> String {
    let calendar = Calendar.current
    var dateComponents = DateComponents()
    dateComponents.year = year
    dateComponents.month = month
    
    for day in getDays(year, month, week) {
      dateComponents.day = day
      if let date = calendar.date(from: dateComponents) {
        let components = calendar.dateComponents([.weekday], from: date)
        
        if weekDays[components.weekday ?? 0] == weekday {
          let formatter = DateFormatter()
          formatter.dateFormat = "yyyy-MM-dd"
          return formatter.string(from: date)
        }
      }
    }
    return "ERROR: no date found"
  }
  
  private static func getDays(_ year: Int, _ month: Int, _ week: String) -> [Int] {
    if month == 2 && week == "last" {
      if isLeap(year) {
        return daysOfWeek["leapfeblast"]!
      } else {
        return daysOfWeek["nonleapfeblast"]!
      }
    }
    return daysOfWeek[week]!
  }
  
  private static func isLeap(_ year: Int) -> Bool {
    if year % 4 != 0 {
      return false
    } else if year % 100 == 0 && year % 400 != 0 {
      return false
    } else {
      return true
    }
  }
}
