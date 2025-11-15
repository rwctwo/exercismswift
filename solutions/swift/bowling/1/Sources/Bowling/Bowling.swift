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
  
  func add(_ count: Int) throws {
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
  
  override func add(_ count: Int) throws {
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
      //then the total of last two must less than 11 (max 10 apare)
      if status == .strike && throw2 < 10 && throw2 + throw3 > 10 {
        throw BowlingError.tooManyPinsInFrame
      }
    }
  }
}

class Bowling {
//  private var frames: [Frame] = Array(repeating: Frame(), count: 9) + [LastFrame()] //BAD: this creates only one Frame
  private var frames: [Frame] = (0..<9).map { _ in Frame() } + [LastFrame()]
  private var currentFrame = 0
  
  init(_ pins: [Int]) {
    //assume the parameter is valid; no input checking is done
    for pin in pins {
      try! roll(pins: pin)
    }
  }
  
  func roll(pins: Int) throws {
    guard pins < 11 else { throw BowlingError.tooManyPinsInFrame }
    guard pins >= 0 else { throw BowlingError.negativePins }
    guard currentFrame < 10 else { throw BowlingError.gameIsOver }
    
    try frames[currentFrame].add(pins)

    if frames[currentFrame].isComplete {
      currentFrame += 1
    }
  }
  
  func score() throws -> Int {
    guard frames[9].isComplete else { throw BowlingError.gameInProgress }
    var total = 0
    
    for idx in 0..<8{
      total += frames[idx].score
      
      switch frames[idx].status {
      case .strike:
        total += frames[idx + 1].score
        if frames[idx + 1].status == .strike {
          total += frames[idx + 2].throw1
        }
      case .spare:
        total += frames[idx + 1].throw1
      case .open:
        break
      }
    }
    
    total += frames[8].score
    switch frames[8].status {
    case .strike: total += frames[9].throw1 + frames[9].throw2
    case .spare: total += frames[9].throw1
    case .open: break
    }
    
    return total + frames[9].score
  }
}