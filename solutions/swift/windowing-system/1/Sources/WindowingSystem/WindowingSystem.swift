// TODO: Define the Size struct
struct Size {
    var width: Int = 80
    var height: Int = 60
    
    mutating func resize(newWidth: Int, newHeight: Int) {
        width = newWidth
        height = newHeight
    }
}
// TODO: Define the Position struct
struct Position {
    var x: Int = 0
    var y: Int = 0
    
    mutating func moveTo(newX: Int, newY: Int) {
        x = newX
        y = newY
    }
}

// TODO: Define the Window class
class Window {
    var title: String = "New Window"
    var screenSize = Size(width: 800, height: 600)
    var size = Size()
    var position = Position()
    var contents: String?
    
    init() {
    }
    
    init(title: String, contents: String?,
         size: Size = Size(), position: Position = Position()) {
        self.title = title
        self.size = size
        self.position = position
        self.contents = contents
    }
    
    func resize(to: Size) -> () {
        var newWidth = max(1, to.width)
        var newHeight = max(1, to.height)
        
        if position.x + newWidth > screenSize.width {
            newWidth = screenSize.width - position.x
        }
        if position.y + newHeight > screenSize.height {
            newHeight = screenSize.height - position.y
        }
        
        size.resize(newWidth: newWidth, newHeight: newHeight)
    }
    
    func move(to: Position) {
        var newX = max(0, to.x)
        var newY = max(0, to.y)
        
        if newX + size.width > screenSize.width {
            newX = screenSize.width - size.width
        }
        if newY + size.height > screenSize.height {
            newY = screenSize.height - size.height
        }
        
        position.moveTo(newX: newX, newY: newY)
    }
    
    func update(title: String) -> () {
        self.title = title
    }
    
    func update(text: String?) -> () {
        self.contents = text
    }

  /*
Soooo much headache because of typo!!!
  I was writing "This window is intentionally left blank"
  BUT there is NO "is"
  Was not able to detect this typo error SIGH

  The system using this display method to check all operations is 
  problematic because even when the operation itself such as resize, move, 
  etc are working the failure error is shown, simply because the 'display' 
  is not working.

  Very bad test routine
  */
    func display() -> String {
        //NOTE: to ouput (0, 0) for Position, you CANNOT use the default
        // Position: \(position) because it will output
        // (x: 0, y: 0) !!
        return "\(title)\nPosition: (\(position.x), \(position.y)), Size: (\(size.width) x \(size.height))\n\(contents ?? "[This window intentionally left blank]")\n"
    }
}
