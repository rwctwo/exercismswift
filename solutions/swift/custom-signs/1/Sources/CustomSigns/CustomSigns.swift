// TODO: define the 'birthday' String constant
let birthday = "Birthday"

// TODO: define the 'valentine' String constant
let valentine = "Valentine's Day"

// TODO: define the 'anniversary' String constant
let anniversary = "Anniversary"

// TODO: define the 'space' Character constant
let space: Character = " "

// TODO: define the 'exclamation' Character constant
let exclamation: Character = "!"

func buildSign(for occasion: String, name: String) -> String {
  // fatalError("Please implement the buildSign(for:name:) function")
  return "Happy " + occasion + String(space) + name + String(exclamation)
}

func graduationFor(name: String, year: Int) -> String {
  // fatalError("Please implement the graduationFor(name:year:) function")
  return "Congratulations " + name + String(exclamation) + "\nClass of \(year)"
}

func costOf(sign: String) -> Int {
  // fatalError("Please implement the costOf(sign:) function")
  return 20 + sign.count * 2
}
