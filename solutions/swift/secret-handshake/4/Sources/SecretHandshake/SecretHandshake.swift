//Version 4: Without using the 'actions' array
func commands(number: Int) -> [String] {
  var result : [String] = []
  var bitValue : Int = 1
  var number = number
  
  while number > 0 {
    if number % 2 == 1 {
      switch bitValue {
      case  1: result.append("wink")
      case  2: result.append("double blink")
      case  4: result.append("close your eyes")
      case  8: result.append("jump")
      case 16: result.reverse()
      default: break
      }
    }
    number /= 2
    bitValue *= 2
  }
  
  return result
}

