//
//  ContentView.swift
//  ArthmeticAce
//
//  Created by Leo Lu on 2022-02-07.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Stored properties
    @State var multiplicand = Int.random(in: 1...12)
    @State var multiplier = Int.random(in: 1...12)
    @State var inputGiven = ""
    
    // Has an answeer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    //MARK: Computed properties
    // What is the correct product?
    var correctProduct: Int {
        return multiplicand * multiplier
    }
    
    var body: some View {
        
        VStack(spacing:0){
            HStack {
                Text("✕")
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(multiplicand)")
                    Text("\(multiplier)")
                    
                }
            }
            .font(.system(size: 72))
            .padding(.horizontal)
            
            Divider()
            
            HStack {
                
                ZStack{
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(Color.green)
                    //            CONDITION      true  false
                        .opacity(answerCorrect ? 1.0 : 0.0)
                    
                    Image(systemName: "x.square")
                        .foregroundColor(Color.red)
                    //            CONDITION      true  false
                        .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
                    
                    Spacer()
                    TextField("",
                              text: $inputGiven)
                        .multilineTextAlignment(.trailing)
                }
            }
            Button(action: {
                
                
                // Answer has been checked!
                answerChecked = true
                
                // Convert the input given to an integer, if possible
                guard let productGiven = Int(inputGiven) else {
                    // Sadness, not a number
                    answerCorrect = false
                    return
                }
                // Check the answer!
                if productGiven == correctProduct {
                    // Celebrate!
                    answerCorrect = true
                } else {
                    // Sadness, they gave a number, but it's not correct
                    answerCorrect = false
                    
                }
            }, label: {
                Text("Check Answer")
                    .font(.largeTitle)
                
                    .opacity(answerChecked ? 0.0 : 1.0)
            })
                .padding()
                .buttonStyle(.bordered)
            
            Button(action: {
                multiplicand = Int.random(in: 1...12)
                multiplier = Int.random(in: 1...12)
                inputGiven = ""
                answerChecked = false
                answerCorrect = false
            }, label: {
                Text("Another Question")
                    .font(.largeTitle)
                
                
            })
                .padding()
                .buttonStyle(.bordered)
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
