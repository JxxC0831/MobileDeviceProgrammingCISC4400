import UIKit

class vehicle {
    var speed = 0
    var color = ""
    var numberOfDoor = 0
    //methods
    func turnLeft() {
        print("Vehicle Turning Left")
    }
    func turnRight() {
        print("Vehicle Turning Right")
    }
}

class tank : vehicle {
    var numberOfShells = 60
    func fireCannon () {
        print("Firing the cannon")
    }
    
    func fireSmokeGranades() {
        print("Firing smoke")
    }
}

class yellowSchoolBus : vehicle {
    var numberOfSeats = 50
    
    func blickRedLights() {
        print("Blick Red Lights")
    }
    
}

// create an object
var leopard = tank()
var bus = yellowSchoolBus()
leopard.speed = 20
leopard.color = "Green"
leopard.turnLeft()
leopard.turnRight()

bus.turnLeft()
bus.turnRight()


