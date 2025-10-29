import Foundation

func cryptoSquare(text: String) -> String {
 // Normalize: lowercase and remove punctuation/whitespace
   // let removalSet = CharacterSet.punctuationCharacters.union(.whitespacesAndNewlines)
   let normalized = text.lowercased().components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
   
   // Early exit for empty normalized input
   if normalized.isEmpty { return "" }
 
   // Compute rows and cols according to crypto square rules
   let n = normalized.count
   let root = sqrt(Double(n))
   var rows = Int(floor(root))
   var cols = Int(ceil(Double(n) / Double(rows)))
   if cols - rows > 1 {
     rows += 1
     cols = Int(ceil(Double(n) / Double(rows)))
   }
 
   // Build rows (pad the last row with spaces to length `cols`)
   var square: [String] = []
   var i = 0
   while i < n {
     let startIdx = normalized.index(normalized.startIndex, offsetBy: i)
     let endOffset = min(i + cols, n)
     let endIdx = normalized.index(normalized.startIndex, offsetBy: endOffset)
     var row = String(normalized[startIdx..<endIdx])
     if row.count < cols {
       row.append(String(repeating: " ", count: cols - row.count))
     }
     square.append(row)
     i += cols
   }
  
   // Read column-wise to produce encrypted text
   var encrypted = ""
   for c in 0..<cols {
     for r in 0..<rows {
       let row = square[r]
       let idx = row.index(row.startIndex, offsetBy: c)
       encrypted.append(row[idx])
     }
   }
 
   // Split encrypted into chunks of length `rows` and join with spaces
    let fullChunks = cols - (encrypted.count - cols * rows)
    var result: [String] = []
    for _ in stride(from: 0, to: fullChunks, by: 1) {
      result.append(String(encrypted.prefix(rows)))
      encrypted = String(encrypted.dropFirst(rows))
    }
    for _ in stride(from: fullChunks, to: cols, by: 1) {
      result.append(String(encrypted.prefix(rows-1) + " "))
      encrypted = String(encrypted.dropFirst(rows-1))
    }
  
    return result.joined(separator: " ")
 }