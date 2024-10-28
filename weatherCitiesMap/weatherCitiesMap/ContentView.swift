//
//  ContentView.swift
//  weatherCitiesMap
//
//  Created by Jiaxuan on 9/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Button (action: {
                    
                }, label:  {
                    NavigationLink(destination: weatherCityView()){
                        Text("Manhattan")
                            .padding()
                            .foregroundColor(Color.blue)
                            .font(.largeTitle)
                    }
                })//end button
                
                Button (action: {
                    
                }, label:  {
                    NavigationLink(destination: weatherCityView()){
                        Text("Manhattan")
                            .padding()
                            .foregroundColor(Color.blue)
                            .font(.largeTitle)
                    }
                })//end button
                
                
                
            }//end VStack
            
        }//end Navifation view
        
        //functions would go here
        
    }//end body
}//end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
