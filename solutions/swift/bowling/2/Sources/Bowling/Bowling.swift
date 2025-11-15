/* Improved (Cleaned Up) Version
As in the first version, this uses the Frame and LastFrame classes
to record the throws. By utilizing the Frame-based OOP model, the
logic of the roll and score methods become much more clearer than
the direct solution that uses a flat roll array. This version cleans
up the logic of the score method with the two helper functions
nextOne and nextTwo for computing bonus points.
*/
enum BowlingError: Error {
  case negativePins
  case tooManyPinsInFrame
  case gameInProgress
  case gameIsOver
}

class Frame { 
  enum Status {
    case strike
    case spare
    case open
  }
  
  var throw1 = 0
  var throw2 = 0
  var isFirstThrow = true
  var isComplete = false
  var status: Status = .open
  
  var score: Int { throw1 + throw2 }
  
  func record(_ count: Int) throws {
    guard throw1 + count <= 10 else { throw BowlingError.tooManyPinsInFrame }
    if isFirstThrow {
      throw1 = count
      isFirstThrow = false
      if count == 10 {
        status = .strike
        isComplete = true
      }
    } else {
      throw2 = count
      if score == 10 && status == .open {
        status = .spare
      }
      isComplete = true
    }
  }
}

class LastFrame: Frame {
  var throw3: Int = 0
  var isSecondThrow = false

  override var score: Int { throw1 + throw2 + throw3 }
  
  override func record(_ count: Int) throws {
    guard score + count <= 30 else { throw BowlingError.tooManyPinsInFrame }
    
    if isFirstThrow {
      throw1 = count
      isFirstThrow = false
      isSecondThrow = true
      if count == 10 {
        status = .strike
      }
    } else if isSecondThrow {
      throw2 = count
      isSecondThrow = false
      if score < 10 {
        isComplete = true
      }
      if score == 10 && status == .open {
        status = .spare
      }
    } else if status != .open {
      throw3 = count
      isComplete = true
      //if the first throw is a strike and the second is less than 10,
      //then the total of the last two throws must less than 11 (max possible is spare)
      if status == .strike && throw2 < 10 && throw2 + throw3 > 10 {
        throw BowlingError.tooManyPinsInFrame
      }
    }
  }
}

final class Bowling {
  private let lastFrameIdx = 9
  private var currentFrameIdx = 0
  private var frames: [Frame]

  init(_ pins: [Int]) {
    //assume the parameter is valid per the provided tests; no input checking is done
    frames = (0..<lastFrameIdx).map { _ in Frame() } + [LastFrame()]
    for pin in pins {
      try! roll(pins: pin)
    }
  }
  
  private func nextOne(after frameIndex: Int) -> Int {
    let idx = frameIndex + 1
    return frames[idx].throw1
  }
  
  private func nextTwo(after frameIndex: Int) -> Int {
    var idx = frameIndex + 1
    var total = frames[idx].throw1
    if frames[idx].status != .strike {
      total += frames[idx].throw2
    } else {
      total += idx < lastFrameIdx ? frames[idx+1].throw1 : frames[idx].throw2
    }
    return total
  }
  
  func roll(pins: Int) throws {
    guard pins < 11 else { throw BowlingError.tooManyPinsInFrame }
    guard pins >= 0 else { throw BowlingError.negativePins }
    guard !frames[lastFrameIdx].isComplete else { throw BowlingError.gameIsOver }
    
    try frames[currentFrameIdx].record(pins)
    
    if frames[currentFrameIdx].isComplete {
      currentFrameIdx = min(currentFrameIdx + 1, lastFrameIdx)
    }
  }
  
  func score() throws -> Int {
    guard frames[lastFrameIdx].isComplete else { throw BowlingError.gameInProgress }
    
    var total = 0
    
    for i in 0..<lastFrameIdx {
      let frame = frames[i]
      total += frame.score
      
      switch frame.status {
      case .strike:
        let bonus = nextTwo(after: i) // Next two throws as bonus
        total += bonus
      case .spare:
        let bonus = nextOne(after: i) // Next throw as bonus
        total += bonus
      case .open:
        break
      }
    }
    
    return total + frames[lastFrameIdx].score
  }
}