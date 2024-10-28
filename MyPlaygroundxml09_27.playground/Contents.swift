import UIKit

var cityCode = "Boston"
//let urlString = "http://w1.weather.gov/xml/current_obs/" + cityCode + ".xml"
let urlString = "https://api.openweathermap.org/data/2.5/weather?q=" + cityCode + ",us&APPID=15a4398b3b640c9a86fccb0f46c5ca88"
guard let url = URL(string: urlString)
else {
    print("Hey man, THIS URL DOES NOT WORK!")
    exit(-1)
}
//perform the HTTP request
let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
    if error != nil {
        print("URL gave an ERROR")
        exit(-2)
    }//end of if
    
    //convert HTTP response data to a string
    if let data = data, let dataString = String(data: data, encoding: .utf8) {
        print("\(dataString)")
    }//end let data
}//end of the task

task.resume()
