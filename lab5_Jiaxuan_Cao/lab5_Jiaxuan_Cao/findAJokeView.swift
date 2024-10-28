//
//  findAJokeView.swift
//  lab5_Jiaxuan_Cao
//
//  Created by Jiaxuan on 10/13/24.
//

import SwiftUI

struct Joke: Decodable {
    let setup: String
    let delivery: String
}

struct Jokeslist: Decodable {
    let jokes: [Joke]
}

struct findAJokeView: View {
    @State private var jokes = [Joke]()
    
    var body: some View {
        NavigationView {
            List(jokes, id: \..setup) { joke in
                VStack(alignment: .leading) {
                    Text(joke.setup)
                        .font(.headline)
                        .foregroundColor(.cyan)
                    Text(joke.delivery)
                        .font(.body)
                        .foregroundColor(.indigo)
                }
            }
            .navigationTitle("Random Jokes")
            .task {
                await fetchJokesData()
            }
        }
    }
    
    func fetchJokesData() async {
        guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any?type=twopart&amount=10") else {
            print("Hey Man, THIS URL DOES NOT WORK!")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Jokeslist.self, from: data) {
                jokes = decodedResponse.jokes
            }
        } catch {
            print("Bad news ... This data is not valid :-(")
        }
    }
}



struct findAJokeView_Previews: PreviewProvider {
    static var previews: some View {
        findAJokeView()
    }
}
