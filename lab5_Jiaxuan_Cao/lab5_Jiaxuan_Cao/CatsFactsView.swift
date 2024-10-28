//
//  CatsFactsView.swift
//  lab5_Jiaxuan_Cao
//
//  Created by Jiaxuan on 10/13/24.
//

import SwiftUI

struct CatFact: Decodable {
    let text: String
}

struct CatsFactsView: View {
    @State private var catFacts = [CatFact]()
    
    var body: some View {
        List(catFacts, id: \..text) { fact in
            VStack(alignment: .leading) {
                Text(fact.text)
                    .font(.body)
                    .foregroundColor(.indigo)
            }
        }
        .navigationTitle("Cat Facts")
        .task {
            await fetchCatFactsData()
        }
    }
    
    func fetchCatFactsData() async {
        guard let url = URL(string: "https://cat-fact.herokuapp.com/facts") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([CatFact].self, from: data) {
                catFacts = decodedResponse
            }
        } catch {
            print("Bad news ... This data is not valid :-(")
        }
    }
}



struct CatsFactsView_Previews: PreviewProvider {
    static var previews: some View {
        CatsFactsView()
    }
}
