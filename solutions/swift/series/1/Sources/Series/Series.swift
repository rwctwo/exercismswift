enum SeriesError: Error {
  case sliceLengthLongerThanSeries
  case sliceLengthZeroOrLess
  case emptySeries
}

//Note: Why is this exercise at the Medium level? This seems to be a very
//basic straightforward Swift String slicing coding exercise.
class Series {
  let value: String
  
  init(_ value: String) {
    self.value = value
  }
  
  func slice(_ length: Int) throws -> [String] {
    guard !value.isEmpty else { throw SeriesError.emptySeries }
    guard length > 0 else { throw SeriesError.sliceLengthZeroOrLess }
    guard length <= self.value.count else { throw SeriesError.sliceLengthLongerThanSeries }
    
    var subSeries: [String] = []
    
    for startLoc in stride(from: 0, to: value.count - length+1, by: 1) {
      let startIndex = value.index(value.startIndex, offsetBy: startLoc)
      let endIndex = value.index(value.startIndex, offsetBy: startLoc + length)
      subSeries.append(String(value[startIndex..<endIndex]))
    }
    
    return subSeries
  }
}