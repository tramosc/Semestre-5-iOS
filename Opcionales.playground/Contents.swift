import UIKit

var x1:Double?
var x2,a,b,c:Double!

a=10
b=115
c=20

x1 = (-b+(sqrt(pow(b, 2)-(4*a*b*c))))/(2*a)
x2 = (-b-(sqrt(pow(b, 2)-(4*a*b*c))))/(2*a)

print("El primer resultado es: \(x1!)")
print("El primer resultado es: \(x2!)")
