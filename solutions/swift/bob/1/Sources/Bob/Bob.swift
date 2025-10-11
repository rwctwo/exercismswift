import Foundation

class Bob {
    
    enum Reply: String {
        case sure = "Sure."
        case whoa = "Whoa, chill out!"
        case calmdown = "Calm down, I know what I'm doing!"
        case fine = "Fine. Be that way!"
        case whatever = "Whatever."
    }
    
    static func isAllCaps(_ s: String) -> Bool {
        let t = s.filter(\Character.isLetter)
        return !t.isEmpty && t.allSatisfy(\Character.isUppercase)
      //if t is empty then s has no alphabets so return false
      
      //Without Key Path expressions, we will have
      //  ... t = s.filter({ ("A"..."Z").contains($0) ||
      //                     ("a"..."a").contains($0) })
      //  ... t.allSatisfy({ ("A"..."Z").contains($0) })
    }
    
    static func response(_ message: String) -> String {
        let str = message.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if str.isEmpty {
            return Reply.fine.rawValue
        }
        
        if str.last == "?" {
            if isAllCaps(str) { //all caps question
                return Reply.calmdown.rawValue
                
            } else {
                return Reply.sure.rawValue //regular question
            }
        }
        
        if isAllCaps(str) { //all caps, no question mark
            return Reply.whoa.rawValue
        }
        
        return Reply.whatever.rawValue
    }
}
