enum CircularBufferError: Error {
  case bufferEmpty
  case bufferFull
}

struct CircularBuffer {
  private var size = 0
  private var first = -1
  private var last = 0
  private var buffer: [Int]
  
  init(capacity: Int) {
    self.buffer = [Int](repeating: 0, count: capacity)
  }
  
  mutating func write(_ value: Int) throws {
    if size == buffer.count {
      throw CircularBufferError.bufferFull
    }
    buffer[last] = value
    last = (last + 1) % buffer.count
    size += 1
  }
  
  mutating func read() throws -> Int {
    if size == 0 {
      throw CircularBufferError.bufferEmpty
    }
    first = (first + 1) % buffer.count
    size -= 1
    return buffer[first]
  }
  
   mutating func overwrite(_ value: Int) {
    if size < buffer.count { //not full yet, so
      try! write(value)      //it's a regular write
    } else {
      //overwrite the oldest (first) 
      first = (first + 1) % buffer.count
      buffer[first] = value
    }
  }

  mutating func clear() {
    size = 0
    first = 0
    last = 0
  }
}
