//
//  ContentView.swift
//  firstMDPAPP08_30_24
//
//  Created by Jiaxuan on 8/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            VStack{
                Text("Hello, world!")
                    .padding()
                Text("Wecome to LC in Manhattan!")
                
            }//end VStack
            VStack {
                Text("message 2")
                    .padding()
                Text("Message 3")
                    .padding()
            }//end VStack
        }//end HStack
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
