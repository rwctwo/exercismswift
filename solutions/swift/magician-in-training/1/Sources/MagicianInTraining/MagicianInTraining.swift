//Specification for this exercise set is imprecise.
//'index' must be checked for setCard, removeCard, and insert. However, you don't have
//to check it in getCard. It passed the tests. The index value for getCard could potentially
//be out of bound, as required to be tested in other methods. But you don't need to test it here.
//So index seemed to be expected as correct in getCard, but for the other methods. Expectation
//is not consistent among methods. 
//Instructions should provide more information on the expectations / assumptions
//on the parameters.
func getCard(at index: Int, from stack: [Int]) -> Int {
  // fatalError("Please implement the getCard(at:from:) function")
  return stack[index]
}

//guard stmt not introduced yet in learning exercise set, so won't use it here
func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
  // fatalError("Please implement the setCard(at:from:to:) function")
  var result = stack
  if index < 0 || index >= stack.count {
    return stack
  } else {
    result[index] = newCard
    return result
  }
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
  // fatalError("Please implement the insert(_:atTopOf:) function")
  var result = stack
  result.append(newCard)
  return result
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
  // fatalError("Please implement the removeCard(at:from:) function")
  if index < 0 || index >= stack.count {
    return stack
  } else {
    var result = stack
    result.remove(at: index)
    return result
  }
}

func insert(_ newCard: Int, at index: Int, from stack: [Int]) -> [Int] {
  // fatalError("Please implement the insert(_:at:from:) function")
  if index < 0 || index > stack.count {
    return stack
  } else {
    var result = stack
    result.insert(newCard, at: index)
    return result
  }
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
  // fatalError("Please implement the checkSizeOfStack(_:_:) function")
  return stack.count == size
}
