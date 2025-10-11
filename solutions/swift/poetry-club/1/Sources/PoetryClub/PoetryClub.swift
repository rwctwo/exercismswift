import Foundation

func splitOnNewlines(_ poem: String) -> [String] {
  // fatalError("Please implement the splitOnNewlines(_:) function")
  return poem.components(separatedBy: "\n")
}

func frontDoorPassword(_ phrase: String) -> String {
    // fatalError("Please implement the frontDoorPassword(_:) function")
    let lines = splitOnNewlines(phrase)
    var firsts: [Character] = []
  //firsts needs to be an array of Character because 
  //line.first returns a Character
    for line in lines {
        firsts.append(line.first ?? "_")
    }
    return String(firsts)
}

func backDoorPassword(_ phrase: String) -> String {
  // fatalError("Please implement the backDoorPassword(_:) function")
  let lines = splitOnNewlines(phrase)
  var lasts: [Character] = []

  for line in lines {
    lasts.append(line.trimmingCharacters(in: .whitespaces).last!)
  }

  return String(lasts) + ", please"
}

func secretRoomPassword(_ phrase: String) -> String {
  // fatalError("Please implement the secretRoomPassword(_:) function")
  let lines = splitOnNewlines(phrase)
  var secrets: [Character] = []
  var i = 0
  
  for line in lines {
    let idx = line.index(line.startIndex, offsetBy: i)
    secrets.append(line[idx])
    i += 1
  }

  return String(secrets).uppercased() + "!"
}
