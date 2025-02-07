//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Андрей Кузнецов on 07.02.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitel = ""
    
    @State private var score: Int = 0
    
    @State private var iteration = 0
    @State private var showFinal = false
    
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [.white, .blue,.red], startPoint: .topLeading, endPoint: .bottomTrailing )
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flage")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the Flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .padding()
                    }
                    
                    
                    ForEach(0..<3) {number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .shadow(radius: 5.0)
                                .clipShape(Capsule())
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 30)
                .background (.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                Text("Score: \(self.score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
                Spacer()
                
            }
            .padding( )
        }
        .alert("Score", isPresented: $showingScore) {
            Button("Ok", action: askQuestion)
        } message: {
            Text(scoreTitel)
        }
        .alert("Game Over", isPresented: $showFinal) {
            Button("OK", action: newGame)
        } message: {
            Text("Your score is \(score)")
        }
        
        
    }
    
    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            scoreTitel = "You are right!!!"
        } else {
            scoreTitel = "You ate wrong! This is a flag of \(self.countries[number])"
        }
        showingScore = true
    }
    
    private func askQuestion() {
        
        guard iteration <= 8
        else {
            showFinal = true
            return
        }
        
        self.countries = self.countries.shuffled()
        self.correctAnswer = Int.random(in: 0...2)
        self.iteration += 1
        
    }
    
    private func newGame() {
        score = 0
        iteration = 0
        askQuestion()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
