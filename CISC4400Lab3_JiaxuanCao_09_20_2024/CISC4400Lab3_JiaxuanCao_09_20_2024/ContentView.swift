//
//  ContentView.swift
//  CISC4400Lab3_JiaxuanCao_09_20_2024
//
//  Created by Jiaxuan on 9/20/24.
//

import SwiftUI


struct ContentView: View {
@State var slot1: String=""

    var body: some View {
        ZStack{
            Image("xxx")
                .ignoresSafeArea()
            VStack {
                Text("UNIX RULES!!!")
                    .padding()
                    .font(.largeTitle)
                
                Text("Today is Friday")
                    .padding()
                    .font(.largeTitle)
                Text("This is more text for you")
                    .padding()
                    .font(.largeTitle)
                
            }// end VStack
            
            
        
        }
        HStack{
            
        }//end hstack
        
        Button ( action: {
            
            var randomnumber: Int = 0
            randomnumber = randomnumber in(1...4 )
            slot1 = "city 1" + String(randomnumber)
            }, label: {
                Text("Submit")
            
        })
    }//end body
}//end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
