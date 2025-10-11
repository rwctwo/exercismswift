enum NucleotideCountErrors: Error {
    case invalidNucleotide
}

class DNA {
    private var _dict : [String:Int] = ["A":0,"T":0,"C":0,"G":0]
    
    init(strand: String) throws {
        //throw exception if any character not G, A, T, or C
        //present in the strand
        for ch in strand.uppercased() {
            let str = String(ch)
            if let count = _dict[str] {
                _dict[str] = count + 1
            } else {
                throw NucleotideCountErrors.invalidNucleotide
            }
        }
    }
    
    func counts() -> [String:Int] {
        _dict
    }
}
