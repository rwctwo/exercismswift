func commands(number: Int) -> [String] {
  let actions = ["wink", "double blink", "close your eyes", "jump", "REVERSE"]
  let binary = Array(String(number, radix: 2)).reversed()
  
  var result : [String] = []
  
  for (index, bit) in binary.enumerated() {
    if bit == "1" {
      result.append(actions[index])
    }
  }
  
  if !result.isEmpty {
    if result.last! == "REVERSE" {
      result.removeLast()
      result.reverse()
    }
  }
  
  return result
}
