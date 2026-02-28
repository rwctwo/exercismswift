let letterScores: [Character: Int] = [
  "A": 1, "E": 1, "I": 1, "O": 1, "U": 1, "L": 1, "N": 1, "R": 1, "S": 1, "T": 1,
  "D": 2, "G": 2,
  "B": 3, "C": 3, "M": 3, "P": 3,
  "F": 4, "H": 4, "V": 4, "W": 4, "Y": 4,
  "K": 5,
  "J": 8, "X": 8,
  "Q": 10, "Z": 10
]

//Alternate way for building a dictionary
//Use this if we want to update / change the
//scores easily
/*
 // Letter scores dictionary: [Character: Int]
 let letterScores: [Character: Int] = {
 var dict: [Character: Int] = [:]
 for c in "AEIOULNRST" { dict[c] = 1 }
 for c in "DG" { dict[c] = 2 }
 for c in "BCMP" { dict[c] = 3 }
 for c in "FHVWY" { dict[c] = 4 }
 dict["K"] = 5
 for c in "JX" { dict[c] = 8 }
 for c in "QZ" { dict[c] = 10 }
 return dict
 }()
 */

func score(_ phrase: String) -> Int {
  return phrase.uppercased().reduce(0) { $0 + (letterScores[$1] ?? 0) }
}
