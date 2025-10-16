//Version 2: 
//Alternative implementation for the Direction enum using a bit
//Swift enum features.
//The original version with explicitly specified cases is 
//probably a little easier to understand
enum Direction: Int, CaseIterable {
  case north, east, south, west //listing order is critical  
  
  func turnLeft() -> Direction {
    return Direction.allCases[(self.rawValue + 3) % 4] // (n - 1 + 4) % 4
  }

  func turnRight() -> Direction {
    return Direction.allCases[(self.rawValue + 1) % 4]
  }
}

struct RobotState {
  var x: Int
  var y: Int
  var bearing: Direction
  
  init(_ x: Int, _ y: Int, _ bearing: Direction) {
    self.x = x
    self.y = y
    self.bearing = bearing
  }
}

class SimulatedRobot {
  private var current: RobotState
  
  var state: RobotState {
    current
  }
  
  init(x: Int, y: Int, bearing: Direction) {
    self.current = RobotState(x, y, bearing)
  }
  
  func move(commands: String) {
    for command in Array(commands) {
      switch command {
      case "L":
        current.bearing = current.bearing.turnLeft()
        
      case "R":
        current.bearing = current.bearing.turnRight()
        
      case "A":
        switch current.bearing {
        case .north:
          current.y += 1
        case .east:
          current.x += 1
        case .south:
          current.y -= 1
        case .west:
          current.x -= 1
        }
        
      case _: //ignore unknown command
        break
      }
    }
  }
}
