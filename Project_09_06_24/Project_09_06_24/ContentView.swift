//
//  ContentView.swift
//  Project_09_06_24
//
//  Created by Jiaxuan on 9/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("bird3")
                //.resizable()
                //.ignoresSafeArea()
            Text("Hello, bird!")
                .padding()
                .background(.blue)
                .font(.largeTitle)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
