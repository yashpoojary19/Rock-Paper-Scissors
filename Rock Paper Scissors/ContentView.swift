//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Yash Poojary on 17/10/21.
//

import SwiftUI

struct ContentView: View {
    let objects = ["Rock", "Paper", "Scissors"]
    @State private var currentChoice = 0
    @State private var decision = Bool.random()
    @State private var randomComputedChoice = Int.random(in: 0...2)
    @State private var showingResult = "False"
    @State private var score = 0
    
    
    
    var body: some View {
        VStack(spacing: 10) {
            Group {
                if decision == true {
                    Text("You have to win the game")
                } else {
                    Text("You have to lose the game")
                }
            }
            .font(.headline)
            
            Text(objects[randomComputedChoice])
                .font(.headline)
            
            HStack {
                ForEach(0..<objects.count) { number in
                    Button(action: {
                            checkToWin(selectedName: self.objects[number])
                    }) {
                        Text("\(objects[number])")
                    }
                     
                }
            }
            
            Button("New Game") {
                decision.toggle()
            }
            
        }
    }
    
    func checkToWin(selectedName: String) {
        guard let index = objects.firstIndex(where: { $0 == objects[randomComputedChoice]}) else
        { return }
        
        let prefixArray = objects.prefix(upTo: index)
        let suffixArray = objects.suffix(from: index)
        
        let wrappedArray = prefixArray + suffixArray
        
        guard let computedIndex = wrappedArray.firstIndex(where: {$0 == objects[randomComputedChoice]}) else
        { return }
    
        guard let selectedIndex = wrappedArray.firstIndex(where: { $0 == selectedName }) else {
            return
        }
        
        if decision {
            score += computedIndex + 1 == selectedIndex ? 1 : 0
        } else {
            score += !(computedIndex + 1 == selectedIndex) ? 1 : 0
        }
   
    
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
