//
//  ContentView.swift
//  lab4_Jiaxuan Cao
//Created by Jiaxuan Cao on 10/5/24

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                //---------------------------------------------------------------------
                Button(action: {
                    // no Swift code yet
                    
                } , label: {
                    NavigationLink(destination: lab4elementview(element: "Boston")) {
                        Text("Boston")
                            .padding()
                            .foregroundColor(Color.yellow)
                            .font(.largeTitle)
                            .underline()
                            .fontDesign(.serif)
                        
                        
                    }
                }) // end button
                .background(
                    Image("BostonImg")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 300, height: 100)
                    
                )
                
                
                //---------------------------------------------------------------------
                Button(action: {
                    
                    // no Swift code yet
                    
                } , label: {
                    NavigationLink(destination: lab4elementview(element: "Manhattan")) {
                        Text("NYC")
                            .padding()
                            .foregroundColor(Color.yellow)
                            .font(.largeTitle)
                            .underline()
                            .fontDesign(.serif)
                        
                    }
                }) // end button
                .background(
                    Image("ManhattanImg")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 300, height: 100)
                        .fontDesign(.serif)
                        .underline()
                )
                
                //---------------------------------------------------------------------
                Button(action: {
                    
                    // no Swift code yet
                    
                } , label: {
                    NavigationLink(destination: lab4elementview(element: "Miami")){
                        Text("Miami")
                            .padding()
                            .foregroundColor(Color.yellow)
                            .font(.largeTitle)
                            .fontDesign(.serif)
                            .underline()
                    }
                }) // end button
                .background(
                    Image("MiamiImg")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 300, height: 100)
                )
                
                //---------------------------------------------------------------------
                Button(action: {
                    
                    // no Swift code yet
                    
                } , label: {
                    NavigationLink(destination: lab4elementview(element: "Dallas")) {
                        Text("Dallas")
                            .padding()
                            .foregroundColor(Color.yellow)
                            .font(.largeTitle)
                            .fontDesign(.serif)
                            .underline()
                    }
                }) // end button
                .background(
                    Image("DallasImg")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 300, height: 100)
                        .fontDesign(.serif)
                        .underline()
                )
                
                //---------------------------------------------------------------------
                Button(action: {
                    
                    // no Swift code yet
                    
                } , label: {
                    NavigationLink(destination: lab4elementview(element: "Denver")) {
                        Text("Denver")
                            .padding()
                            .foregroundColor(Color.yellow)
                            .font(.largeTitle)
                            .fontDesign(.serif)
                            .underline()
                        
                    }
                }) // end button
                .background(
                    Image("DenverImg")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 300, height: 100)
                        .fontDesign(.serif)
                        .underline()
                )
                
                //---------------------------------------------------------------------
                Button(action: {
                    
                    // no Swift code yet
                    
                } , label: {
                    NavigationLink(destination: lab4elementview(element: "Nashville")) {
                        Text("Nashville")
                            .padding()
                            .foregroundColor(Color.yellow)
                            .font(.largeTitle)
                            .fontDesign(.serif)
                            .underline()
                        
                    }
                }) // end button
                .background(
                    Image("NashvilleImg")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 300, height: 100)
                        .fontDesign(.serif)
                        .underline()
                )
                
                //---------------------------------------------------------------------
                Button(action: {
                    
                    // no Swift code yet
                    
                } , label: {
                    NavigationLink(destination: lab4elementview(element: "Lincoln")) {
                        Text("Lincoln")
                            .foregroundColor(Color.yellow)
                            .font(.largeTitle)
                            .fontDesign(.serif)
                            .underline()
                        
                    }
                }) // end button
                .background(
                    Image("LincolnImg")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 300, height: 100)
                        .fontDesign(.serif)
                        .underline()
                )
                
            } // end VStack
                    
        } // end navigation view
        
    } // end body
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
