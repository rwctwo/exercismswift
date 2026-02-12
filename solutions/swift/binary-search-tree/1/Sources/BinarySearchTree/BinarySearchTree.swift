class BinarySearchTree<T : Comparable> {
  var left: BinarySearchTree<T>?
  let data: T
  var right: BinarySearchTree<T>?
  
  init(_ data: T, left: BinarySearchTree<T>? = nil, right: BinarySearchTree<T>? = nil) {
    self.data = data
    self.left = left
    self.right = right
  }
  
  public func insert(_ data: T) {
    let node = BinarySearchTree(data)
    
    if data <= self.data { //dup data goes to left too
      if let left = self.left {
        left.insert(data)
      } else {
        self.left = node
      }
    } else {
      if let right = self.right {
        right.insert(data)
      } else {
        self.right = node
      }
    }
  }

  public func allData() -> [T] {
    let leftData = self.left?.allData() ?? []
    let rightData = self.right?.allData() ?? []
    return leftData + [self.data] + rightData
  }
}
