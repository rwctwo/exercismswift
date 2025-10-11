func toRna(_ dna: String) -> String {
  //Using mapping with a dictionary
  let translate : [Character: Character] = 
    ["G": "C", 
     "C": "G", 
     "T": "A", 
     "A": "U"]

  //Note:
  // Dictionary access returns an Optional so we need !
  // dna.map returns an array of Character, so we create
  // a String from it before returning
  
  return String(dna.map{ translate[$0]! } )
  
/*
  //With a straightforward for loop
  var rna = ""
  for c in dna {
    rna.append(translate[c]!)
  }
  return rna
*/
}
