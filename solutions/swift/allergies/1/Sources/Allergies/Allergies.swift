class Allergies {
  private static let allergens: [String] = ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]
  
  private var allergies: [String] = []
  
  init (_ score: Int) {
    var index: Int = 0
    var score: Int = score
    
    while score > 0  && index < 8 {
      
      if score % 2 == 1 {
        allergies.append(Allergies.allergens[index])
      }
      
      index += 1
      score /= 2
    }
  }
  
  func list( ) -> [String] {
    return allergies
  }
  
  func allergicTo(item allergen: String) -> Bool {
    return allergies.contains(allergen)
  }
}
