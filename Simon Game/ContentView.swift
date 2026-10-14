//
//  ContentView.swift
//  Simon Game
//
//  Created by Christian Collins on 10/13/26.
//





import SwiftUI

struct ContentView: View {
    @State private var playerInput: [Int] = []
    @State private var sequence: [Int] = []
    @State private var gameStarted = false
    @State private var litColor: Int? = nil
    @State private var showingSequence = false
    @State private var message = "Press Start Game"

    var body: some View {
        VStack(spacing: 20) {
            Text("SIMON")
                .font(.largeTitle.bold())

            Text(message)
            Text("Round: \(sequence.count)")
            Text("Progress: \(playerInput.count)/\(sequence.count)")

            colorGrid

            Button("Start Game") {
                startGame()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    var colorGrid: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                colorButton(0, .green)
                colorButton(1, .red)
            }
            HStack(spacing: 12) {
                colorButton(2, .yellow)
                colorButton(3, .blue)
            }
        }
    }

    func colorButton(_ number: Int, _ color: Color) -> some View {
        Button {
            guard gameStarted && !showingSequence else { return }
            playerInput.append(number)

            let index = playerInput.count - 1
            if playerInput[index] != sequence[index] {
                message = "Wrong pattern! Try again."
                gameStarted = false
            } else if playerInput.count == sequence.count {
                message = "Correct! Next round soon."
            }
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .fill(litColor == number ? color.opacity(0.45) : color)
                .frame(width: 140, height: 140)
        }
        .buttonStyle(.plain)
    }

    func startGame() {
        sequence = [Int.random(in: 0...3)]
        playerInput = []
        gameStarted = true
        message = "Watch the pattern!"
        playSequence()
    }

    func playSequence() {
        showingSequence = true
        for (index, number) in sequence.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.8 + 0.5) {
                litColor = number
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.8 + 0.9) {
                litColor = nil
                if index == sequence.count - 1 {
                    showingSequence = false
                    message = "Repeat the pattern!"
                }
            }
        }
    }
}

#Preview {
    ContentView()
}



