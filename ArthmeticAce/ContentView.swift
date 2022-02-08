//
//  ContentView.swift
//  ArthmeticAce
//
//  Created by Leo Lu on 2022-02-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(spacing:0){
            HStack {
                Text("✕")
                
                Spacer()
                
                VStack{
                
                Text("5")
                Text("6")
                    
                }
            }
            .font(.system(size: 72))
            .padding(.horizontal)
            
            Divider()
            
            HStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(Color.green)
                Spacer()
                Text("30")
            }
            
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
