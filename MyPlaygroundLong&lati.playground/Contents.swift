import UIKit

// Fordham University, Bronx NYC,  Walsh Library
///var latitude  = "40.86122"
//var longitude = "-73.88923"

//beijing
var latitude = "39.9042"
var longitude = "116.4074"

// Acropolis, Athens Greece
// let latitude  = "37.970833"
// let longitude = "23.726110"

// London,  Great Britain
// let latitude  = "51.509865"
// let longitude = "-0.118092"

// Miami, FL
//let latitude  = "25.761681"
//let longitude = "-80.191788"


// create the URL
let urlString = "https://api.opencagedata.com/geocode/v1/json?key=c2e1c48160d3411185d8cd0bf48fae7c&q=" + latitude + "%2C" + longitude + "&pretty=1"
    
guard let url = URL(string: urlString)
else {
    print("Hey Man, THIS URL DOES NOT WORK!")
    exit(-1)
}
    
// Perform HTTP Request
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    // Check for Error
    if let error = error {
        print("Error took place \(error)")
        exit(-2)
    }
     
    // Convert HTTP Response Data to a String
    if let data = data, let dataString = String(data: data, encoding: .utf8) {
            
        print("\(dataString)")
                
    } // end let data
}
                
task.resume()
