class Year {
  // Write your code for the 'Leap' exercise in this file.
  let year: Int

  init(calendarYear: Int) {
    year = calendarYear
  }

  var isLeapYear: Bool {
    /*
    if year % 4 != 0 { 
      return false       //not div by 4
      
    } else if year % 100 != 0 { 
      return true        //div by 4, not div by 100
      
    } else if year % 400 != 0 { 
      return false      //div by 4, div by 100, not div by 400
      
    } else {
      return true      //div by 4, div by 100, div by 400
    }
    */
    
    if year % 4 != 0 {
      return false

    } else if year % 100 == 0 && year % 400 != 0 {
      return false

    } else { 
      return true //we reach here when either
                  //1. div by 4, not div by 100
                  //2. div by 4, div by 100, div by 400
                  //Same condition as the above version
    }
  }
}
