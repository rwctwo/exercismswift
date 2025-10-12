//Straight recursive solution
//Key here is how to declare the parameter
//since Swift is strongly typed. The answer
//is [Any?]. 'Any' represents any valid type.
//We need Any? because there could nil
//Sample tests involve only Int values, but could easily make it
//for any type by declaring generic type T
func flattenArray<T>(_ array: [Any?]) -> [T] {
  if array.isEmpty {
    return []
    
  } else {
    let first = array[0] ?? []
    let rest = Array(array.suffix(array.count-1))
    
    let front = first is [Any?] ?
                    flattenArray(first as! [Any?]) :
                    [first as! T]
    
    return front + flattenArray(rest)
  }
}