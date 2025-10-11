func getName(_ item: (name: String, amount: Int)) -> String {
  // fatalError("Please implement the getName(_:) function")
  return item.name
}

func createToy(name: String, amount: Int) -> (name: String, amount: Int) {
  // fatalError("Please implement the createToy(name:amount:) function")
  return (name, amount)
}

func updateQuantity(_ items: [(name: String, amount: Int)], toy: String, amount: Int) ->  [(name: String, amount: Int)] {
  // fatalError("Please implement the updateQuantity(_:toy:amount) function")
  /*
  Version 1: Create a separate array. Add elements in the items array, updating the
  amount info accordingly.
  */
  // var updatedList: [(name: String, amount: Int)] = []
  // for item in items {
  //   if item.name == toy {
  //     updatedList.append((name: item.name, amount: amount))
  //   } else {
  //     updatedList.append(item)
  //   }
  // }
  // return updatedList

  /*
  Verstion 2: Use a copy if the items array. Use the indexing approach to refer to the elements
  in the array. Indexing approach is critical here. See the Note below
  */
  var updatedList = items
  for idx in 0..<updatedList.count {
    if updatedList[idx].name == toy {
      updatedList[idx].amount = amount
    }
  }
  return updatedList
  /*
  Note: This version won't work. It looks fine, but the problem is the variable item
  in the for loop. 'item' is NOT referring an item in the updatedList array. It's a copy.
  So updating it won't change the one in the array. Version 2 above works because the
  expression updatedList[idx] is referring the item actually in the array
  */
  // var updatedList = items
  // for var item in updatedList {
  //   if item.name == toy {
  //     item.amount = amount
  //   }
  // }
  // return updatedList
}

func addCategory(_ items: [(name: String, amount: Int)], category: String) -> [(name: String, amount: Int, category: String)] {
  // fatalError("Please implement the addCategory(_:category:) function")
  var newList: [(name: String, amount: Int, category: String)] = []
  for item in items {
    newList.append((name: item.name, amount: item.amount, category: category))
  }
  return newList
}
