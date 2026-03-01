enum TranslationError: Error {
  case invalidCodon
}

let toAminoAcidFrom: [String: String] = [
  "AUG": "Methionine",
  "UUU": "Phenylalanine",
  "UUC": "Phenylalanine",
  "UUA": "Leucine",
  "UUG": "Leucine",
  "UCU": "Serine",
  "UCC": "Serine",
  "UCA": "Serine",
  "UCG": "Serine",
  "UGU": "Cysteine",
  "UGC": "Cysteine",
  "UAC": "Tyrosine",
  "UAU": "Tyrosine",
  "UGG": "Tryptophan"
]

let stopCode = ["UAG", "UAA", "UGA"]

func translationOfRNA(rna strand: String) throws -> [String] {
  var aminoAcids: [String] = []
   
  for offset in stride(from: 0, to: strand.count, by: 3) {//0, 3, 6, 9, ...
    let startIndex = strand.index(strand.startIndex, offsetBy: offset)
    let endIndex = strand.index(startIndex, offsetBy: 3, limitedBy: strand.endIndex) ?? strand.endIndex
    let codon = String(strand[startIndex..<endIndex])
    
    if codon.count < 3 {
      throw TranslationError.invalidCodon
    }
    
    if stopCode.contains(codon) { break }
    
    if let aminoAcid = toAminoAcidFrom[codon] {
      aminoAcids.append(aminoAcid)
    } else { //unrecognized codon
      throw TranslationError.invalidCodon
    }
  }
  
  return aminoAcids
}