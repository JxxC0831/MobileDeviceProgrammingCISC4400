//
//  ContentView.swift
//  Lab3_JiaxuanCao_09_23
//
//  Created by Jiaxuan on 9/23/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var card1:String = "card1"
    @State private var card2:String = "card2"
    @State private var card3:String = "card3"
    @State private var card4:String = "card4"
    @State private var card5:String = "card5"
    @State private var card6:String = "card6"
    @State private var card7:String = "card7"
    @State private var card8:String = "card8"
    @State private var card9:String = "card9"
    @State private var card10:String = "card10"
    //message and message2
    @State private var resultMessage:String = ""
    @State private var resultMessage2:String = ""


    
    var body: some View {
        VStack {
            HStack {
                Image(card1)
                    .resizable()
                Image(card2)
                    .resizable()
            } // end HStack
            
            HStack {
                Image(card3)
                    .resizable()
                
                Image(card4)
                    .resizable()
            } // end HStack
            
            HStack {
                Image(card5)
                    .resizable()
                
                Image(card6)
                    .resizable()
            } // end HStack
            HStack {
                Image(card7)
                    .resizable()
                
                Image(card8)
                    .resizable()
            } // end HStack
            HStack {
                Image(card9)
                    .resizable()
                
                Image(card10)
                    .resizable()
            } // end HStack
            Button(action: {
                //
                // Swift Code-generate random number between 1 and 13
                //
                
                var randomNumber:Int = 0
                var nums: [Int]=[]

                
                for i in 1...10 {
                    randomNumber = Int.random(in: 1...10)
                    nums.append(randomNumber)
                    if i == 1 {
                        card1 = "card" + String(randomNumber)
                    }
                    else if i == 2 {
                        card2 = "card" + String(randomNumber)
                    }
                    else if i == 3 {
                        card3 = "card" + String(randomNumber)
                    }
                    else if i == 4 {
                        card4 = "card" + String(randomNumber)
                    }
                    else if i == 5 {
                        card5 = "card" + String(randomNumber)
                    }
                    else if i == 6 {
                        card6 = "card" + String(randomNumber)
                    }
                    else if i == 7 {
                        card7 = "card" + String(randomNumber)
                    }
                    else if i == 8 {
                        card8 = "card" + String(randomNumber)
                    }
                    else if i == 9 {
                        card9 = "card" + String(randomNumber)
                    }
                    else if i == 10 {
                        card10 = "card" + String(randomNumber)
                    }
                    
                } // end for loop
                    
                // Find the largest value: use .max and .min
                if let high = nums.max(), let low = nums.min() {
                    
                    // Find sum:add all elements in an array
                    let sum = nums.reduce(0, +)
                    
                    // Average: trans sum from int to double, and divie number of elements
                    let average = Double(sum) / Double(nums.count)
                    
                    // Position of high
                    var positionOfHigh = -1 //safe value, if no, display -1
                    if let indexOfHigh = nums.firstIndex(of: high) { //find index of high
                        positionOfHigh = indexOfHigh + 1 //array position +1
                    }
                    
                    // Position of low
                    var positionOfLow = -1
                    if let indexOfLow = nums.firstIndex(of: low) {
                        positionOfLow = indexOfLow + 1
                    }
                    
                    // Frequency of each number
                    var frequencyDict: [Int: Int] = [:]  //store num and appear time in to a 2d array
                    for num in nums {
                        frequencyDict[num, default: 0] += 1//if there is a same number +1, else, create a new number with 0
                    }
                    
                    // Find the most frequent number(s)
                    let mostFrequency = frequencyDict.values.max()//max value in frequencyDict array
                    let mostFrequentNumbers = frequencyDict.filter { $0.value == mostFrequency }.keys//store everything into a map and search
                    let mostFrequentNumbersString = mostFrequentNumbers.map { String($0) }.joined(separator: ", ")
                    
                    // Range high to low
                    let range = high - low
                    
                    
                    
                    resultMessage = "High: \(high)\n" +
                    "Sum: \(sum)\n" +
                    "Pos# of High: \(positionOfHigh)\n" +
                    "Average: \(average)"
                    
                    resultMessage2 = "Low: \(low)\n" +
                    "Freq(most): \(mostFrequentNumbersString)\n" +
                    "Pos# of Low: \(positionOfLow)\n" +
                    "Range(High - Low): \(range)"
                }//end if
            }, label: {
                Text("RANDOM")
                    .padding()
                    .foregroundColor(Color.green)
                    .font(.largeTitle)
                
            }) // end button
            HStack {
                Text(resultMessage)
                Text("                  ")
                Text(resultMessage2)
                
            }//endHStack
            .frame(width: 400, height: 110,alignment: .leading)
            .foregroundColor(Color.black)
            .background(Color.green)

            
            
        } // end VStack
        
    } // end body
    
} // end struct


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
