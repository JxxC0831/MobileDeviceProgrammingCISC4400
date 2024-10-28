//
//  ContentView.swift
//  dataValidatio_09_13_2024
//
//  Created by Jiaxuan on 9/13/24.
//

import SwiftUI

struct ContentView: View {
    @State private var companyName: String = ""
    @State private var Address:  String = ""
    @State private var City: String = ""
    @State private var State: String = ""
    @State private var ZipCode: String = ""
    @State private var PhoneNum: String = ""
    @State private var EmailAddress: String = ""
    @State private var MobilePhone: String = ""
    @State private var MobileCarrier: String = ""
    @State private var Username: String = ""
    @State private var Password: String = ""
    @State private var Re_EnterPassword: String = ""
    
    
    var body: some View {
        VStack{
            //Title
            Text("New Company Registration")
                .padding()
                .foregroundColor(.blue)
            //company name
            TextField("Enter Company Name:", text: $companyName)
                .textFieldStyle(.roundedBorder)
            //address
            TextField("Enter Address:", text: $Address)
                .textFieldStyle(.roundedBorder)
            //City
            TextField("City:", text: $City)
                .textFieldStyle(.roundedBorder)
            //State
            TextField("State - Abbreviation(2 Chars, ie. NY...:", text: $State)
                .textFieldStyle(.roundedBorder)
            Group {
                //Zip code
                TextField("Zip Code:", text: $ZipCode)
                    .textFieldStyle(.roundedBorder)
                //Phone Number
                TextField("Phone Number:", text: $PhoneNum)
                    .textFieldStyle(.roundedBorder)
                
                //Email Address
                TextField("Email Address:", text: $EmailAddress)
                    .textFieldStyle(.roundedBorder)
                //Mobile Phone
                TextField("Mobile Phone:", text: $MobilePhone)
                    .textFieldStyle(.roundedBorder)
                //Mobile Carrier
                TextField("Mobile Carrier(AT&T,Verizon,T-Mobile):", text: $MobileCarrier)
                    .textFieldStyle(.roundedBorder)
                //Username
                TextField("Username(at least 10 chars and no blank):", text: $Username)
                    .textFieldStyle(.roundedBorder)
                //Password
                SecureField("Password(at least 10 chars and one upper case:", text: $Password)
                    .textFieldStyle(.roundedBorder)
                //Re_Enter Password
                SecureField("Re-Enter Password:", text: $Re_EnterPassword)
                    .textFieldStyle(.roundedBorder)
            }
            // button - submit
            Button (action: {
                Task{
                    validateUserInput()
                }//end Task
            }, label: {
                Text("Click - SUBMIT DATA")
                    .font(.title3)
                    .padding()
                    .background(.green)
                    .background(.green)
            })//end label
            
            
        }// end VStack
    }//end body
    
    //function for check digits
    //return true if all digits, flase if contain anything else
    func isDigitsOnly(_ string: String) -> Bool {
        let digits = CharacterSet.decimalDigits
        return string.unicodeScalars.allSatisfy { digits.contains($0) }
    }
    
    //function to check if the password has at leat one upper case
    //return true if there is a Uppercase char, flase if there is no uppercase char
    func checkUppercase(_ string: String) -> Bool {
        return string.contains {$0.isUppercase}
    }
    
    //function presentAlert
    func presentAlert(withTitle title: String, message : String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    //function: ValidateUserinput
    //Needed: at least 5 characters in lenth
    func validateUserInput() {
        //company name at least 5 characters in length
        if companyName.count < 5 {
            print("Error: Company name needs to be at least 5 characters")
            return
        }
        
        //address, at least 5 characters in length
        if Address.count < 5 {
            print("Error: Address needs to be at least 5 characters")
            return
        }
        
        //City, at least 5 characters in length
        if City.count < 5 {
            print("Error: City needs to be at least 5 characters")
            return
        }
        
        //State, must be NY or NJ or TX
        if !(State.contains("NY") || State.contains("NJ") || State.contains("TX")){
            print("Error: Wrong state name. Only avaliable in NY/NJ/TX. Please select one from above!")
            return
        }
        
        //Zip code, at least 5 characters and only digits
        if ZipCode.count != 5 || !isDigitsOnly(ZipCode){
            print("Error: Zip code needs to be 5 characters and only DIGITS")
            return
        }
        
        //phone number, at least 10 characters and only digits
        if PhoneNum.count != 10 || !isDigitsOnly(PhoneNum){
            print("Error: Phone number needs to be 10 characters and only DIGITS")
            return
        }
        
        //Email address, at least 5 characters and contain @ and .
        if EmailAddress.count < 5 || !EmailAddress.contains("@") || !EmailAddress.contains(".") {
            print("Error: Email address needs to be at least 5 characters and contain '@' and '.'")
            return
        }
        
        //mobile Phone, at least 10 characters and only digits
        if MobilePhone.count < 10 || !isDigitsOnly(MobilePhone) {
            print("Error: Mobile phone needs to be at least 10 characters and only DIGITS")
            return
        }
        
        //mobile carrier, has to be one of them(AT&T, Verizon, T-Mobile)
        if !(MobileCarrier.contains("AT&T") || MobileCarrier.contains("T-Mobile") || MobileCarrier.contains("Verizon")) {
            print("Error: Mobile Carrier needs to be one of AT&T, T-Mobile and Verizon")
            return
        }
        
        //Username, at least 10 characters and no black characters
        if Username.count < 10 || Username.contains(" ") {
            print("Error: Username needs to be at least 10 characters and no black allowed")
            return
        }
        
        //password, at least 10 characters and one upper case
        if Password.count < 10 || !checkUppercase(Password){
            print("Error:Password needs to be at least 10 characters and on upper case")
            return
        }
        
        // re_enter password, has to match with password entered from last one
        if Re_EnterPassword != Password {
            print("Error: Re_enter password does not match your password")
            return
        }
        print("Success! New Customer was Added")
    }//end function
}//end struct


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
