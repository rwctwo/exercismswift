enum HammingError: Error {
    case lengthMismatch
}

struct Hamming {
  static func compute(_ dnaSequence: String, against: String) throws -> Int? {
    if dnaSequence.count != against.count {
        throw HammingError.lengthMismatch
    }
    
    var difference: Int = 0

    //standard for loop version
    for (dna, against) in zip(dnaSequence, against) {
        if dna != against {
            difference += 1
        }
    }
    
    //forEach version
    // zip(dnaSequence, against).forEach { (dna, against) in
    //   if dna != against {
    //     difference += 1
    //   }
    // }

    //reduce version
    // difference = 
    //   zip(dnaSequence, against).reduce(0) { (acc, item) -> Int in
    //     let (dna, against) = item
    //     return acc + (dna != against ? 1 : 0)
    //   }

    return difference
  }
}
