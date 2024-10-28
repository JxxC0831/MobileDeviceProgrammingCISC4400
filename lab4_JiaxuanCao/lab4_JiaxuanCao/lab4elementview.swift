//
//  lab4elementview.swift
//
//  Created by Jiaxuan Cao on 10/5/24.
//

import SwiftUI


struct lab4elementview: View {
    var element:String
    
    @State private var pictureName: String = ""
    @State private var cityInfo: String = ""

    
    var body: some View {
        
        VStack {
            //img of target city
            Image(pictureName)
                .resizable()
                .ignoresSafeArea()
                .frame(width: 300, height: 300)
            //this is title for city name
            Text(element)
                .font(.largeTitle)
                .underline()
                .bold()
                .italic()
            //this is city information
            Text(cityInfo)

        }
        .task {
            if element == "Boston" {
                pictureName = "BostonImg"
            //information from https://worldpopulationreview.com/us-cities/massachusetts/boston
                cityInfo = "Boston city is located in Suffolk County Massachusetts. Boston city has a 2024 population of 654,423.Boston was founded in 1630, making it one of the oldest cities in the country, and it was the scene of many important events in the American Revolution. Today, the city is an international center for medicine and higher learning."

            }
            else if element == "Manhattan" {
                pictureName = "ManhattanImg"
                //getting information from Wiki(https://en.wikipedia.org/wiki/Manhattan)
                cityInfo = "Manhattan is the most densely populated and geographically smallest of the five boroughs of New York City. Coextensive with New York County, Manhattan is the smallest county by geographical area in the U.S. state of New York. Located almost entirely on Manhattan Island near the southern tip of the state, Manhattan constitutes the center of the Northeast megalopolis and the urban core of the New York metropolitan area. Manhattan serves as New York City's economic and administrative center and has been described as the cultural, financial, media, and entertainment capital of the world."
            }
            else if element == "Miami" {
                pictureName = "MiamiImg"
                //infromation from https://en.wikipedia.org/wiki/Miami
                cityInfo = "Miami, officially the City of Miami, is a coastal city in the U.S. state of Florida and the county seat of Miami-Dade County in South Florida. It is the core of the Miami metropolitan area, which, with a population of 6.14 million, is the second-largest metropolitan area in the Southeast after Atlanta, and the ninth-largest in the United States. With a population of 442,241 as of the 2020 census, Miami is the second-most populous city in Florida after Jacksonville. Miami has the third-largest skyline in the U.S. with over 300 high-rises, 61 of which exceed 491 ft (150 m)."
            }
            else if element == "Dallas" {
                pictureName = "DallasImg"
                //information from https://en.wikipedia.org/wiki/Dallas
                cityInfo = "Dallas is a city in the U.S. state of Texas and the most populous city in the Dallas–Fort Worth metroplex, the most populous metropolitan area in Texas and the fourth-most populous metropolitan area in the United States at 7.5 million people. It is the most populous city in and seat of Dallas County with portions extending into Collin, Denton, Kaufman, and Rockwall counties. With a 2020 census population of 1,304,379, it is the ninth-most populous city in the U.S. and the third-most populous city in Texas after Houston and San Antonio. Located in the North Texas region, the city of Dallas is the main core of the largest metropolitan area in the Southern United States and the largest inland metropolitan area in the U.S. that lacks any navigable link to the sea."
            }
            else if element == "Denver" {
                pictureName = "DenverImg"
                //information from https://en.wikipedia.org/wiki/Denver
                cityInfo = "Denver is a consolidated city and county, the capital, and most populous city of the U.S. state of Colorado.[1] With a population of 715,522 as of the 2020 census, a 19.22% increase since 2010, it is the 19th-most populous city in the United States and the fifth most populous state capital. Denver is the principal city of the Denver–Aurora–Lakewood metropolitan statistical area, the most populous metropolitan area in Colorado as well as the economic and cultural center of the broader Front Range Urban Corridor, home to more than 5 million people."
            }
            else if element == "Nashville" {
                pictureName = "NashvilleImg"
                //information from https://en.wikipedia.org/wiki/Nashville,_Tennessee
                cityInfo = "Nashville, often known as Music City, is the capital and most populous city in the U.S. state of Tennessee and the county seat of Davidson County. Located in Middle Tennessee, it had a population of 689,447 at the 2020 U.S. census. Nashville is the 21st most populous city in the United States, and the fourth most populous city in the southeastern U.S. Located on the Cumberland River, the city is the center of the Nashville metropolitan area, and is one of the fastest growing in the nation."
            }
            else if element == "Lincoln" {
                pictureName = "LincolnImg"
                //information from https://en.wikipedia.org/wiki/Lincoln,_Nebraska
                cityInfo = "Lincoln is the capital of the U.S. state of Nebraska and the county seat of Lancaster County. The city covers 100.4 square miles (260.035 km2) and had a population of 294,757 in 2023. It is the state's second-most populous city and the 71st-largest in the United States. Lincoln is considered the economic and cultural anchor of the substantially larger metropolitan area in southeastern Nebraska, the Lincoln Metropolitan and Lincoln-Beatrice Combined Statistical Areas, which is home to 361,921 people, the 104th-largest combined statistical area in the United States."
            }
            else {
                cityInfo = "City not found"
                
            }
        }//end if-else
        
    } // end body
    
}//end struct

struct lab4elementview_Previews: PreviewProvider {
    static var previews: some View {
        lab4elementview(element: "Boston")
    }//end view
}//end struct
