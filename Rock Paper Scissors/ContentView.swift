//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Yash Poojary on 17/10/21.
//

import SwiftUI

struct ButtonLook: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonLook())
    }
}

struct ContentView: View {
    let possibleOutcomes = ["Rock", "Paper", "Scissors"]
    @State private var appChoice = Int.random(in: 0...2)
    @State private var result = Bool.random()
    @State private var score = 0
    @State private var playCount = 0
    @State private var gameOver = false
    
    var winOrLose: String {
        if result == true {
            return "WIN"
        } else {
            return "LOSE"
        }
    }
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black] ), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                Text(winOrLose)
                    .font(.headline)
                Text(possibleOutcomes[appChoice])
                HStack {
                    ForEach(0..<possibleOutcomes.count) { number in
                        Button(action: {
                            playerChoice(number)
                            continueGame()
                        }) {
                            Text(possibleOutcomes[number])
                        }
                        .buttonStyle()
                        
                        
                    }
                }
            }
        }
        .alert(isPresented: $gameOver) {
            Alert(title: Text("Game Over"), message: Text("Your score is \(score)"), dismissButton: .default(Text("Okay")) { resetGame()})
        }
    }
    
    func playerChoice(_ number: Int) {
        if result == true {
            if number == appChoice {
                print("Lose the items are the same")
            } else if number == 2 && appChoice == 0 {
                print("Lose")
            } else if number == 0 && appChoice == 1 {
                print("Lose")
            } else if number == 1 && appChoice == 2 {
                print("Lose")
            } else {
                print("Win and add points")
                score += 1
            }
        } else {
            if number == appChoice {
                print("Win")
                score += 1
            } else if number == 2 && appChoice == 0 {
                print("Win")
                score += 1
            } else if number == 0 && appChoice == 1 {
                print("Win")
                score += 1
            } else if number == 1 && appChoice == 2 {
                print("Win")
                score += 1
            } else {
                print("Lose")
            }
            
        }
    }
    
    func continueGame() {
        if playCount == 10 {
            gameOver = true
        } else {
            playCount += 1
            appChoice = Int.random(in: 0...2)
            result = Bool.random()
        }
    }
    
    func resetGame() {
        appChoice = Int.random(in: 0...2)
        result = Bool.random()
        score = 0
        playCount = 1
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
