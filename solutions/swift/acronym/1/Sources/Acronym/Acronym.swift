//Easy Category if Regex is used
struct Acronym {
  nonisolated(unsafe) private static let delim = /[+\-.\(\)_ ]|'s/
  
  static func abbreviate(_ inString: String) -> String {
    return inString
            .split(separator: delim)
            .map{ String($0.prefix(1)).uppercased() }
            .joined()
  }
}
