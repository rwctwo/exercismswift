func sliceSize(diameter: Double?, slices: Int?) -> Double? {
  // fatalError("Please implement the sliceSize(diameter:slices:) function")
  guard let diameter = diameter, let slices = slices else {return nil}

  if diameter < 0 || slices < 1 {
    return nil
  } else {
    let area = Double.pi * (diameter / 2.0) * (diameter / 2.0)
    return area / Double(slices) //per slice area
  }
}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
) -> String {
  // fatalError("Please implement the biggestSlice(diameterA:slicesA:diameterB:slicesB:) function")

  let areaA = sliceSize(diameter: Double(diameterA), slices: Int(slicesA))
  let areaB = sliceSize(diameter: Double(diameterB), slices: Int(slicesB))

  switch (areaA, areaB) {
    case let (valA?, valB?): 
      if valA < valB {
        return "Slice B is bigger"
      } else if valA == valB {
        return "Neither slice is bigger"
      } else {
        return "Slice A is bigger"
      }
    case let (valA?, nil):
      return "Slice A is bigger"

    case let (nil, valB?):
      return "Slice B is bigger"

    default:
      return "Neither slice is bigger"
  }

  
  
}
