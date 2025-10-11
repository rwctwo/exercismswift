func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
  // fatalError("Please implement the protectSecret(_:withPassword:) function")
  func checkPwd(_ pwd: String) -> String {
    if password == pwd {
      return secret
    } else {
      return "Sorry. No hidden secrets here."
    }
  }

  return checkPwd
}

func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {
  // fatalError("Please implement the generateCombination(forRoom:usingFunction) function")
  let first = f(room)
  let second = f(first)
  let third = f(second)

  return (first, second, third)
}
