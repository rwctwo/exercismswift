//Version 3: Functional Style
func commands(number: Int) -> [String] {
  let actions = ["wink", "double blink", "close your eyes", "jump", "REVERSE"]
  let binary = Array(String(number, radix: 2)).reversed()
  
  var result : [String] = zip(binary, actions).compactMap{ $0 == "1" ? $1 : nil }
  
  if !result.isEmpty && result.last! == "REVERSE" {
    result.removeLast()
    result.reverse()
  }
  
  return result
}
