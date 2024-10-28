//
//  ContentView.swift
//  CISC4400_Lab1_JiaxuanCao_0913
//
//  Created by Jiaxuan on 9/13/24.
//

import SwiftUI

struct ContentView: View {
    @State private var emailAddress:  String = ""
    @State private var isEditing = false
    @State private var speed = 50.0
    
    var body: some View {
        
        VStack {
            //fordham image
            ZStack{
                Image("fordham")
                    .resizable()//modifier 1, resizable
                    .scaledToFit()//modifier 2, scaledToFit
                    .frame(width: 100, height: 100)//modifier 3, frame
                    .fixedSize()//modifier 4 fixed size
                    
            }//end ZStack
            
            //title: lab1
            Text("CISC 4400 Lab1")
                .font(.largeTitle)//modifier 5 font with largeTitle
                .background(.black)//modifier 6 background color
                .foregroundStyle(  //modifier 7 foregroundsyle
                    .linearGradient(  //modifier 8 linearGradient
                        colors:[.red,.blue],
                        startPoint: .top,
                        endPoint: .bottom
                                   )
                )//end foregroundStyle
                .cornerRadius(8)//modifer 9 cornerRadius
                .position(x:200,y:80)//modifier 10 position
                .edgesIgnoringSafeArea(.all)//modifier 11 edgesIgnoringSafeArea
                
                
            //Author name:Jiaxuan
            HStack {
                //rectangle
                Rectangle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.purple) //modifier 12 foregroundcolor
                Text("Author Name: Jiaxuan Cao")
                    .font(.subheadline)//modifier 13 front with subhealine
                    .italic()//modifier 14 italic
                    .underline()//modifier 15 underline
                    .padding()//modifier 16
            }//End HStack
            
            
            //cat image area
            Image("cutecat")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())//modifier 17 clipshape
            Text("My Pet cc")
                .font(.caption)//modifier 18 caption
                .underline()
                .padding(2)//modifier 19 with certain values
                .opacity(0.5)//modifier 20 padding
                .border(Color.yellow, width: 2)// modifier 21 border
            
            
            //about me
            HStack {
                Circle()
                    .frame(width: 10, height: 10)
                    
                Text("About me")
                    .italic()
                    .bold()// modifier 22 bold
                    .foregroundColor(.green)
                    .padding(.top,1)//modifier 223padding the top
                    .padding(.bottom,4)//modifier 24 paading of the bottom
            }//end HStack
            Text("  I am a senior major in computer science. I am good at c++ and python. Also I'm a TA for a class at RH.")
                .font(.body)//modifier 25 front with body
                .lineSpacing(3)//modifier 26 linespace
                .multilineTextAlignment(.leading)//modifier 27 multilinetextalignment
                .padding(.top, 4)
                .padding(.bottom, 3)
                .padding(.horizontal, 3)
            
            
            //send a Email
            Text("Need help? Send me an Email!")
                .font(.headline)//modifier 28 front with headline
                .italic()
                .underline()
            
            HStack {
                TextField("Enter your Email address", text: $emailAddress)
                    .textFieldStyle(.roundedBorder)//modifier29 textfieldStyle
                    .shadow(radius: 2)//modifier30 shadow
                //button
                Button (action: {
                    Task{
                        checkValidation()
                    }//end Task
                }, label: {
                    Text("Submit")
                        .font(.title3)//modifier 31 font with title 3
                        .scaleEffect(1)//modifier 32 scaleeffect, size of button
                        .padding(.horizontal,1)
                        .background(.green)
                        
                })
                Button (action: {
                    Task {
                        checkValidation()
                    }//end task
                }, label: {
                    Text("Submit")
                })
                
            }//end Htack
            
            //slider, change color from red to blue based on value from 0 to 100
            VStack{
                Slider(
                    value: $speed,
                    in: 0...100,
                    onEditingChanged: { editing in
                        isEditing = editing
                    }
                )
                Text("\(speed)")
                    .foregroundColor(isEditing ? .red : .blue)
            }
        }//end VStack
        }//end body
        
        //Check the validity of user input
        func checkValidation() {
            if emailAddress.isEmpty {
                print("You have to enter your email address before submit!")
                return
            }
        
            if !emailAddress.contains("@"){
                print("You have to enter a valid email address!")
                return
            }
        
            print("Success! Your email address has been sent to Jiaxuan. Please wait for reply!")
        }//end func
}//end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
