//Straightforward function that reverses a string
//using the defined method reversed(). The only
//complication is that the method returns a ReversedCollection
//struct, so you need to create a String from it
func reverseString(_ input : String) -> String {
    String(input.reversed())
}
