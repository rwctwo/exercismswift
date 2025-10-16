//Version 2: No string conversion
func commands(number: Int) -> [String] {
  let actions = ["wink", "double blink", "close your eyes", "jump", "REVERSE"]
  var result : [String] = []
  var index : Int = 0
  var number = number
  
  while number > 0 {
    if number % 2 == 1 {
      result.append(actions[index])
    }
    number /= 2
    index += 1
  }
  
  if !result.isEmpty && result.last! == "REVERSE" {
      result.removeLast()
      result.reverse()
  }
  
  return result
}
