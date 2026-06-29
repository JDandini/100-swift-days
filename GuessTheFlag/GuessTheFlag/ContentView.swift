//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Javier Castañeda on 18/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var alertBody = ""
    @State private var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Spain",
        "UK",
        "Ukraine",
        "US"
    ].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var scoreValue: Int = 0
    @State private var roundsPlayed: Int = 0
    @State private var showingGameOver = false
    @State private var tappedFlag: Int? = nil
    @State private var rotationAngles: [Double] = [0, 0, 0]

    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: .blue, location: 0.3),
                    .init(color: .red, location: 0.3),
                ],
                center: .top,
                startRadius: 200,
                endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Text("Guess the Flag")
                        .font(.largeTitle.weight(.bold))
                        .foregroundStyle(.white)
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundStyle(.secondary)
                        .font(.largeTitle.weight(.semibold))
                    
                    VStack(spacing: 15) {
                        ForEach(0 ..< 3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                FlagImage(flagName: countries[number])
                            }
                            .rotation3DEffect(
                                .degrees(rotationAngles[number]),
                                axis: (x: 0, y: 1, z: 0)
                            )
                            .opacity(tappedFlag == nil || tappedFlag == number ? 1.0 : 0.25)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Text("Score: \(scoreValue)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
            }
            .padding()
        }.alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                roundsPlayed += 1
                if roundsPlayed >= 8 {
                    showingGameOver = true
                } else {
                    askQuestion()
                }
            }
        } message: {
            Text(alertBody)
        }
        .alert("Game over", isPresented: $showingGameOver) {
            Button("Restart", action: resetGame)
        } message: {
            Text("Final score: \(scoreValue)/8")
        }
        
    }
    
    private func flagTapped(_ number: Int) {
        withAnimation(.linear(duration: 0.6)) {
            rotationAngles[number] += 360
            tappedFlag = number
        }
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreValue += 1
            alertBody = "Score: \(scoreValue)"
        } else {
            scoreTitle = "Wrong"
            let selectedName = countries[number]
            alertBody = "That's the flag of \(selectedName). Try again!"
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            showingScore = true
        }
    }
    
    private func askQuestion() {
        tappedFlag = nil
        rotationAngles = [0, 0, 0]
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    private func resetGame() {
        scoreValue = 0
        roundsPlayed = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
