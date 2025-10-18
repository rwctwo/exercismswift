class Triangle {
  let a : Double
  let b : Double
  let c : Double
  let isTriangle: Bool
  
  var isEquilateral: Bool {
    isTriangle && a == b && b == c
  }
  
  var isIsosceles: Bool { //at least any two are equal
    isTriangle && (a == b || b == c || a == c)
  }
  
  var isScalene: Bool {
    isTriangle && !isEquilateral && !isIsosceles
  }
  
  init(_ sides: [Double]) {
    self.a = sides[0]
    self.b = sides[1]
    self.c = sides[2]
    isTriangle = (a > 0 && b > 0 && c > 0 && 
                  a + b >= c && b + c >= a && a + c >= b)
  }
}
