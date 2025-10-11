//FizzBuzz variation
func raindrops(_ number: Int) -> String {
    var reply = ""
    
    if number % 3 == 0 { reply.append("Pling") }
    if number % 5 == 0 { reply.append("Plang") }
    if number % 7 == 0 { reply.append("Plong") }
    
    if reply.isEmpty { reply = "\(number)" }
    
    return reply
}
