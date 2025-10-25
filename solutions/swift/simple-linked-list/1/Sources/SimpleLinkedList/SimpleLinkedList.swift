class Element<T> {
  var value: T?
  var next: Element?
  
  init(_ value: T? = nil, _ next: Element? = nil) {
    self.value = value
    self.next = next
  }

  static func fromArray(_ array: [T]) -> Element<T> {
    guard !array.isEmpty else { return Element<T>() }
    
    let firstElement = Element(array[0])
    var current: Element? = firstElement
    
    for value in array.dropFirst() {
      let newElement = Element(value)
      current?.next = newElement
      current = newElement
    }
    
    return firstElement
  }
  
  func toArray() -> [T] {
    var result: [T] = []
    var current: Element? = self
    while let element = current {
      if let value = element.value {
        result.append(value)
      }
      current = element.next
    }
    return result
  }
  
  func reverseElements() -> Element<T> {
    var current: Element? = self
    var previous: Element? = nil
    while let element = current {
      let nextElement = element.next
      element.next = previous
      previous = element
      current = nextElement
    }
    return previous!
  }
}