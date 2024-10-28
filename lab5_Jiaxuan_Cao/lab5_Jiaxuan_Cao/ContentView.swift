//
//  ContentView.swift
//  lab5_Jiaxuan_Cao
//
//  Created by Jiaxuan on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            
            VStack {
                // 1) JSON URL  ------------
                NavigationLink(destination: CurrencyView()) {
                    Text("World Currency Abbreviations")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
                
                
                // 2) JSON URL  ------------
                NavigationLink(destination: TodosView()) {
                    Text("TO DO LIST")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
                
                // 3) find A joke
                NavigationLink(destination: findAJokeView() ) {
                    Text("Find A Joke")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
                // 4) Cats Facts
                NavigationLink(destination: CatsFactsView() ){
                    Text("Cats Facts")
                        .font(.title3)
                        .padding(.bottom, 15)
                    
                }
                
                // 5) Dogs Facts
                NavigationLink(destination: DogsFactsView() ){
                    Text("Dogs Facts")
                        .font(.title3)
                        .padding(.bottom, 15)
                    
                }
                
                
            }  // end vertical Stack
            .navigationTitle("JSON SAMPLE URLs")
            
        } // end navigation view
        
    } // end body
    
} // end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
