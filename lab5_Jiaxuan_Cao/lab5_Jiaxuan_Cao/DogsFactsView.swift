//
//  DogsFactsView.swift
//  lab5_Jiaxuan_Cao
//
//  Created by Jiaxuan on 10/13/24.
//


//https://dogapi.dog/api/v2/breeds
import SwiftUI

struct DogBreed: Decodable {
    let type: String
    let attributes: DogBreedAttributes
}

struct DogBreedAttributes: Decodable {
    let name: String
    let description: String
}

struct DogsList: Decodable {
    let data: [DogBreed]
}


struct DogsFactsView: View {
    @State private var dogBreeds = [DogBreed]()
    
    var body: some View {
        NavigationView {
            List(dogBreeds, id: \..attributes.name) { breed in
                VStack(alignment: .leading) {
                    Text("Type: \(breed.type)")
                        .font(.headline)
                        .foregroundColor(.cyan)
                    Text("Breed: \(breed.attributes.name)")
                        .font(.headline)
                        .foregroundColor(.cyan)
                    Text("Description: \(breed.attributes.description)")
                        .font(.body)
                        .foregroundColor(.indigo)
                }
            }
            .navigationTitle("Dog Breeds")
            .task {
                await fetchDogBreedsData()
            }
        }
    }
    func fetchDogBreedsData() async {
        guard let url = URL(string: "https://dogapi.dog/api/v2/breeds") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(DogsList.self, from: data) {
                dogBreeds = decodedResponse.data
            }
        } catch {
            print("Failed to fetch data")
        }
    }
}


struct DogsFactsView_Previews: PreviewProvider {
    static var previews: some View {
        DogsFactsView()
    }
}
