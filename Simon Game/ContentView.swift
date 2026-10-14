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

    var body: some View {
        VStack(spacing: 24) {
            Text("SIMON")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Remember the pattern!")
                .font(.headline)

            Text("Buttons pressed: \(playerInput.count)")
                .font(.subheadline)

            Text("Sequence length: \(sequence.count)")
                .font(.subheadline)

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

            Button("Start Game") {
                sequence = [Int.random(in: 0...3)]
                playerInput = []
                gameStarted = true

                print("Starting sequence:", sequence)
            }
            .buttonStyle(.borderedProminent)

            Button("Clear Presses") {
                playerInput = []
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }

    func colorButton(_ number: Int, _ color: Color) -> some View {
        Button {
            guard gameStarted else { return }

            playerInput.append(number)
            print("Pressed color:", number)
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .frame(width: 140, height: 140)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ContentView()
}
