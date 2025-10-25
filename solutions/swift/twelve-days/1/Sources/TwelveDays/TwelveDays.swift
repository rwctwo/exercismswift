class TwelveDaysSong {
  private static let days: [String] = ["", "first", "second", "third", "fourth", "fifth", "sixth",
                                       "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]
  
  private static let lines: [String] = [
    "",
    "a Partridge in a Pear Tree.",
    "two Turtle Doves, ",
    "three French Hens, ",
    "four Calling Birds, ",
    "five Gold Rings, ",
    "six Geese-a-Laying, ",
    "seven Swans-a-Swimming, ",
    "eight Maids-a-Milking, ",
    "nine Ladies Dancing, ",
    "ten Lords-a-Leaping, ",
    "eleven Pipers Piping, ",
    "twelve Drummers Drumming, "
  ]
  
  private static func verse(_ day: Int) -> String {
    var verse: String = "On the \(days[day]) day of Christmas my true love gave to me: "
    
    if day == 1 {
      return verse + lines[1]
    }
    
    for currentDay in stride(from: day, through: 2, by: -1) {
      verse.append(lines[currentDay])
    }
    verse.append("and " + lines[1])
    
    return verse
  }
  
  static func recite(start: Int, end: Int) -> String {
    var verses: String = ""
    
    for day in start..<end {
      verses.append(verse(day) + "\n")
    }
    verses.append(verse(end))
    
    return verses
    
  }
}