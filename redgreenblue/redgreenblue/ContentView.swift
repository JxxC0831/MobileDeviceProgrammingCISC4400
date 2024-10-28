//
//  ContentView.swift
//  redgreenblue
//
//  Created by Jiaxuan on 10/18/24.
//

import SwiftUI


struct ContentView: View {
    
    @State private var red:Double = 0
    @State private var green:Double = 0
    @State private var blue:Double = 0

    var body: some View {
        VStack {
            Rectangle()
                .frame(width:200, height: 300)
                .foregroundColor(Color(red:red/255, green: green/255, blue: blue/255))
            Slider(value: $red, in: 0...255, step: 1)
            Text("Red: \(Int(red))")
            Slider(value: $green, in: 0...255, step: 1)
            Text("Greem: \(Int(green))")
            Slider(value: $blue, in: 0...255, step: 1)
            Text("Red: \(Int(blue))")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
