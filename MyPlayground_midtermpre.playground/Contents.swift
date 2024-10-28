import UIKit

let count = countMultiplesOf10(numbers: 5, 10, 15, 20, 25, 30, 25, 40)
print("The count was", count)

func countMultiplesOf10(numbers: Int...) -> Int {
    var result = 0
    
    for number in numbers {
        if number % 10 == 0 {
            result += 1
        }
    }
    return result
}

 
var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

for number in numbers {
    if number % 2 == 0 {
        print(number)
    }
    else{
        print("Skipping odd number!")
    }
}//end for loop

let names = ["amy" , "aaa"]
for i in 0...names.count-1 {
    print("Hello:", names[i])
}

