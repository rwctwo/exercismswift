//Version 2: Bitwise-AND to check a particular
//allergy is included in a given number
class Allergies {
  private static let allergens: [String:Int] =
        ["eggs": 1,
         "peanuts": 2,
         "shellfish": 4,
         "strawberries": 8,
         "tomatoes": 16,
         "chocolate": 32,
         "pollen": 64,
         "cats": 128]
  
  
  private var allergies: [String] = []
  private var score: Int
  
 init (_ score: Int) {
    self.score = score
    //need to check in ascending order of the values
    //so the allergy names are returned in the right order
    for (allergen, value) in Allergies.allergens.sorted(by: {$0.value < $1.value}) {
      if score & value != 0 {
        allergies.append(allergen)
      }
    }
  }
  
  func list( ) -> [String] {
    return allergies
  }
  
  func allergicTo(item: String) -> Bool {
    let value = Allergies.allergens[item] ?? 0
    return score & value == value
  }
}
