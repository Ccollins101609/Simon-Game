//
//  ContentView.swift
//  Simon Game
//
//  Created by Christian Collins on 10/13/26.
//






import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var playerInput: [Int] = []
    @State private var sequence: [Int] = []
    @State private var gameStarted = false
    @State private var litColor: Int? = nil
    @State private var showingSequence = false
    @State private var gameOver = false
    @State private var message = "Tap Start to play"

    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 22) {
                Text("SIMON")
                    .font(.system(size: 42, weight: .heavy, design: .rounded))
                    .foregroundStyle(.white)

                Text(gameOver ? "Game Over" : message)
                    .font(.headline)
                    .foregroundStyle(.white)

                Text("Round \(sequence.count)")
                    .foregroundStyle(.white.opacity(0.8))

                colorGrid

                Button("Start / Restart") {
                    startGame()
                }
                .font(.headline)
                .buttonStyle(.borderedProminent)
                .tint(.purple)
            }
            .padding()
        }
    }

    var colorGrid: some View {
        VStack(spacing: 14) {
            HStack(spacing: 14) {
                colorButton(0, .green)
                colorButton(1, .red)
            }

            HStack(spacing: 14) {
                colorButton(2, .yellow)
                colorButton(3, .blue)
            }
        }
    }

    func colorButton(_ number: Int, _ color: Color) -> some View {
        Button {
            guard gameStarted && !showingSequence && !gameOver else {
                return
            }

            let index = playerInput.count
            guard index < sequence.count else { return }

            playerInput.append(number)
            playSound(named: "\(number)")

            if sequence[index] != number {
                gameOver = true
                gameStarted = false
                message = "Wrong color!"
                playSound(named: "Lose")
            } else if playerInput.count == sequence.count {
                gameStarted = false
                message = "Correct!"

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    guard !gameOver else { return }

                    sequence.append(Int.random(in: 0...3))
                    playerInput = []
                    gameStarted = true
                    message = "Watch carefully!"
                    playSequence()
                }
            }
        } label: {
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    litColor == number
                    ? color.opacity(0.45)
                    : color
                )
                .frame(width: 140, height: 140)
                .overlay {
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(.white.opacity(0.2), lineWidth: 2)
                }
        }
        .buttonStyle(.plain)
        .disabled(!gameStarted || showingSequence || gameOver)
    }

    func startGame() {
        sequence = [Int.random(in: 0...3)]
        playerInput = []
        gameStarted = true
        showingSequence = false
        gameOver = false
        litColor = nil
        message = "Watch carefully!"

        playSound(named: "Start")
        playSequence()
    }

    func playSequence() {
        showingSequence = true

        for (index, number) in sequence.enumerated() {
            let delay = Double(index) * 1.0 + 0.5

            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                litColor = number
                playSound(named: "\(number)")
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + delay + 0.4) {
                litColor = nil

                if index == sequence.count - 1 {
                    showingSequence = false
                    message = "Repeat the pattern!"
                }
            }
        }
    }

    func playSound(named name: String) {
        guard let url = Bundle.main.url(
            forResource: name,
            withExtension: "wav"
        ) else {
            print("Sound file not found:", name + ".wav")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Could not play sound:", error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}




