import UIKit

var greeting = "Hello, playground"
@State var car1: String="card1"

let a = "A"

switch a {
    
    case "A","B":
        print("number was A or B")
        print("more lines of code can go here")
    
        if a == "A" {
            print("A")
        }
        else {
            print("B")
        }
    case "c", "d":
        print("number was c or d")
   
    
    //default
    default:
        print("Error: Invalid month number!")
    
    
} // end switch

print("Have a nice day!")

