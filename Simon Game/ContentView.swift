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
                .font(.largeTitle.bold())

            Text("Remember the pattern!")
            Text("Buttons pressed: \(playerInput.count)")
            Text("Sequence: \(sequence.map { colorName($0) }.joined(separator: ", "))")

            colorGrid

            Button("Start Game") {
                playerInput = []
                sequence = [Int.random(in: 0...3)]
                gameStarted = true
            }
            .buttonStyle(.borderedProminent)

            Button("Add Random Color") {
                guard gameStarted else { return }
                sequence.append(Int.random(in: 0...3))
            }
            .buttonStyle(.bordered)
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
            guard gameStarted else { return }
            playerInput.append(number)
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .frame(width: 140, height: 140)
        }
        .buttonStyle(.plain)
    }

    func colorName(_ number: Int) -> String {
        switch number {
        case 0: return "Green"
        case 1: return "Red"
        case 2: return "Yellow"
        default: return "Blue"
        }
    }
}

#Preview {
    ContentView()
}

