enum Direction {
  case north, south, east, west
  
  func turnLeft() -> Direction {
    switch self {
    case .north: return .west
    case .south: return .east
    case .east: return .north
    case .west: return .south
    }
  }
  
  func turnRight() -> Direction {
    switch self {
    case .north: return .east
    case .south: return .west
    case .east: return .south
    case .west: return .north
    }
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
