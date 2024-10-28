//
//  ContentView.swift
//  lampInClass_JiaxuanCao_11OCt
//
//  Created by Jiaxuan on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var companyName: String = ""
    @State var address: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var zipCode: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var mPhone: String = ""
    @State var mCarrier: String = ""
    @State var username: String = ""
    @State var password1: String = ""
    @State var password2: String = ""
    
    @State private var resultMessage: String = ""
    
    
    var body: some View {
        VStack {
            Group {
                Text("New Customer Registration Form")
                    .padding()

                TextField("Enter Company Name", text: $companyName)
                    .textFieldStyle(.roundedBorder)
            
                TextField("Enter Address", text: $address)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Enter City", text: $city)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Enter State", text: $state)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Enter Zip Code", text: $zipCode)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Enter Phone", text: $phone)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Enter Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Enter Mobile Phone", text: $mPhone)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Enter Mobile Carrier", text: $mCarrier)
                    .textFieldStyle(.roundedBorder)
            } // end group #1
            
            
            Group {
                TextField("Enter Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Enter Password", text: $password1)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Re-Enter Password", text: $password2)
                    .textFieldStyle(.roundedBorder)
                
                // Clear button
                Button(action : {
                    Task {
                        
                        await sendNewCustomerData()
                        
                    }
                }, label: {
                    Text("SUBMIT")
                        .font(.title3)
                        .padding()
                })
                
                HStack {
                    Text("Status : ")
                    
                    Text(resultMessage)
                        .frame(width: 275, height: 70, alignment: .leading)
                        .background(Color.cyan)
                        .foregroundColor(Color.black)
                    
                } // end HStack
                
            } // end group #2
            
        } // end vstack
        
    } // end body


    func sendNewCustomerData() async {
        
        resultMessage = "Processing, one moment..."
        
        //
        // create some substrings
        //
        let nameStr =  "name=" + companyName
        let addrStr =  "&address=" + address
        let cityStr =  "&city=" + city
        let statStr =  "&state=" + state
        let zipcStr =  "&zip=" + zipCode
        let phonStr =  "&phone=" + phone
        let emailStr = "&email="  + email
        let mphoStr =  "&mphone=" + mPhone
        let mcarStr =  "&mcarrier=" + mCarrier
        let userStr =  "&username=" + username
        let passStr =  "&password=" + password1
    
        //
        // Prepare URL
        //
        let url = URL(string: "https://storm.cis.fordham.edu/~kounavelis/cgi-bin/insertCustomers.cgi")
                    

        guard let requestUrl = url else { fatalError() }

        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = nameStr + addrStr + cityStr + statStr + zipcStr + phonStr + emailStr +
                         mphoStr + mcarStr + userStr + passStr
                    
        
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
