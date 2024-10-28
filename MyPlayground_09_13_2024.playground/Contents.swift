import UIKit


var a = 1
var b = 2

// > >= < <= == !=
if a > b{
    print("a > b")
    print("a = ", a)
    print("b = ", b)
}
else if a < b{
    print("a < b")
    print("a = ", a)
    print("b = ", b)
}
else {
    print("a = b")
    print("a = ", a)
    print("b = ", b)
}

// && AND  || OR ! not
if !(a > b && a != 0){
    print("#1")
}
else if a < b && b != 0{
    print("#2")
}
else {
    print("#3")
}

print("done with else if block")


