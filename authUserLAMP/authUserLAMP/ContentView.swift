//
//  ContentView.swift
//  authUserLAMP
//
//  Created by Jiaxuan on 10/25/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var username: String   = ""
    @State var password1: String  = ""
    @State var deviceUUID: String = ""
    @State private var resultMessage: String = ""

    var body: some View {
        VStack {
            Group {
                TextField("Enter Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Enter Password", text: $password1)
                    .textFieldStyle(.roundedBorder)
                
                // Create User button
                Button(action : {
                    Task {
                        await sendNewUserData()
                    }
                }, label: {
                    Text("CREATE ACCOUNT")
                        .font(.title3)
                        .padding()
                })
                
                // LOGIN User button
                Button(action : {
                    Task {
                        await loginUserData()
                    }
                }, label: {
                    Text("LOGIN INTO ACCOUNT")
                        .font(.title3)
                        .padding()
                })
                
                HStack {
                    Text("Status : ")
                    
                    Text(resultMessage)
                        .frame(width: 275, height: 70, alignment: .leading)
                        .background(Color.orange)
                        .foregroundColor(Color.black)
                    
                } // end HStack
            } // end group
        } // end vstack
    } // end body

    //
    // function to log in a user (user should already be in the DB)
    //
    func loginUserData() async {
        resultMessage = "Processing, one moment..."
        
        //
        // create some substrings
        //
        let userStr =  "username="  + username
        let passStr =  "&password=" + password1
    
        //
        // Prepare URL
        //
        let url = URL(string: "https://storm.cis.fordham.edu/~kounavelis/cgi-bin/loginUserCS4400.cgi")
                    

        guard let requestUrl = url else { fatalError() }

        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = userStr + passStr
                    
        
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);

        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    resultMessage = "Error took place \(error)"
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    resultMessage = "Resp:\(dataString)"
                    
                    username  = ""
                    password1 = ""
                }
            
        } // end task
        
        task.resume()
    }

    //
    // function to create a new user
    //
    func sendNewUserData() async {
        resultMessage = "Processing, one moment..."
     
        var deviceID: String = ""
        
        //
        // get unique identifier id from the phone
        //
        if let deviceUUID = await UIDevice.current.identifierForVendor?.uuidString {
            deviceID = deviceUUID
        } else {
            deviceID = "Unable to retrieve device ID"
        }
        
        //
        // create some substrings
        //
        let userStr =  "username="  + username
        let passStr =  "&password=" + password1
        let uuidStr =  "&uuid="     + deviceID
        
        //
        // Prepare URL
        //
        let url = URL(string: "https://storm.cis.fordham.edu/~kounavelis/cgi-bin/createUserCS4400.cgi")
                    
        guard let requestUrl = url else { fatalError() }

        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = userStr + passStr + uuidStr
                    
        
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);

        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    resultMessage = "Error took place \(error)"
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    resultMessage = "Resp:\(dataString)"
                    
                    username  = ""
                    password1 = ""
                }
            
        } // end task
        
        task.resume()
        
    } //end function sendNewCustomerData
    
} // end struct


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}

