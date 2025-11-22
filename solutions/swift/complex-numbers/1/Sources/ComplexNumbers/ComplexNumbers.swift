import Foundation

struct ComplexNumbers: Equatable {
  var real: Double
  var imaginary: Double
  
  init(realComponent: Double, imaginaryComponent: Double? = nil) {
    real = realComponent
    imaginary = imaginaryComponent ?? 0
  }

public static func == (lhs: ComplexNumbers, rhs: ComplexNumbers) -> Bool {
    let tol = 0.0001
    return abs(lhs.real - rhs.real) < tol && abs(lhs.imaginary - rhs.imaginary) < tol
  }
  
  func add(complexNumber: ComplexNumbers) -> ComplexNumbers {
    ComplexNumbers(realComponent: real + complexNumber.real, imaginaryComponent: imaginary + complexNumber.imaginary)
  }
  
  func sub(complexNumber: ComplexNumbers) -> ComplexNumbers {
    ComplexNumbers(realComponent: real - complexNumber.real, imaginaryComponent: imaginary - complexNumber.imaginary)
  }
  
  func mul(complexNumber: ComplexNumbers) -> ComplexNumbers {
    ComplexNumbers(
      realComponent: real * complexNumber.real - imaginary * complexNumber.imaginary,
      imaginaryComponent: real * complexNumber.imaginary + imaginary * complexNumber.real
    )
  }
  
  func div(complexNumber: ComplexNumbers) -> ComplexNumbers {
    let denominator = complexNumber.real * complexNumber.real + complexNumber.imaginary * complexNumber.imaginary
    return ComplexNumbers(
      realComponent: (real * complexNumber.real + imaginary * complexNumber.imaginary) / denominator,
      imaginaryComponent: (imaginary * complexNumber.real - real * complexNumber.imaginary) / denominator
    )
  }
  
  func absolute() -> Double {
    let a = real * real
    let b = imaginary * imaginary
    return sqrt(a + b)
  }
  
  func conjugate() -> ComplexNumbers {
    .init(realComponent: real, imaginaryComponent: -imaginary)
  }
  
  func exponent() -> ComplexNumbers {
    //raise e to the self power
    let a = real
    let b = imaginary
    let mag = Foundation.exp(a)
    let cosb = Foundation.cos(b)
    let sinb = Foundation.sin(b)
    return ComplexNumbers(realComponent: mag * cosb, imaginaryComponent: mag * sinb)
    
  }
}