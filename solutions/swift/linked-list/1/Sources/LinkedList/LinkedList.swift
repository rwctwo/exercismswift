//Unsafe implementation!! No safety checks are implemented in order to pass 
//the provided tests.
//All the provided tests assume the calls are made correctly. For example,
//the implementation does not check the deque has at least one element when
//pop or unshift is called. These methods should either throw an exception
//or return nil when an invalid call is made. But such implementation 
//will conflict with the way the provided tests are done.
//
//Note: Not done here, but we use a dummy node to avoid extra testing for the end cases.
class Deque<T> {
  class Node {
    var value: T
    var next: Node?
    weak var prev: Node?

    init(value: T) {
      self.value = value
    }
  }

  private var head: Node?
  private var tail: Node?
  private(set) var count = 0

  var isEmpty: Bool {
    return head == nil
  }

 //Add to the head of this deque
 func unshift(_ value: T) {
    let newNode = Node(value: value)
    if let headNode = head {
      newNode.next = headNode
      headNode.prev = newNode
      head = newNode
    } else {
      head = newNode
      tail = newNode
    }
    count += 1
  }

  //Remove from the head of this deque
  @discardableResult
  func shift() -> T {
    let value = head!.value
    head = head!.next
    head?.prev = nil
    count -= 1
    if count == 0 {
      tail = nil
    }
    return value
  }
  
  //Add to the end of this deque
  func push(_ value: T) {
    let newNode = Node(value: value)
    if let tailNode = tail {
      tailNode.next = newNode
      newNode.prev = tailNode
      tail = newNode
    } else {
      head = newNode
      tail = newNode
    }
    count += 1
  }

  //Remove from the end of this deque
  @discardableResult
  func pop() -> T {
    let value = tail!.value
    tail = tail!.prev
    tail?.next = nil
    count -= 1
    if count == 0 {
      head = nil
    }
    return value
  }

  //Delete the first occurence of 'value' from this deque
  //NOP when the value is not found
  func delete(_ value: T) where T : Equatable {
    var current = head
    while let node = current {
      if node.value == value {
        let prev = node.prev
        let next = node.next
        if let prevNode = prev {
          prevNode.next = next
        } else {
          // deleting head
          head = next
        }
        if let nextNode = next {
          nextNode.prev = prev
        } else {
          // deleting tail
          tail = prev
        }
        count -= 1
        return //only remove the first occurrence
      }
      current = node.next
    }
  }
}