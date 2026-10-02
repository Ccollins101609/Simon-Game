//
//  ContentView.swift
//  Simon Game
//
//  Created by Christian Collins on 9/29/26.
//

import SwiftUI

struct ContentView: View {
    @State private var sequence: [Int] = [0]
    @State private var currentColor = "None"

    var body: some View {
        VStack(spacing: 20) {
            Text("Simon")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Round 1")
                .font(.title3)

            Text("Simon chose:")
                .foregroundStyle(.secondary)

            Text(currentColor)
                .font(.title2)
                .fontWeight(.bold)

            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    Button {
                        print("Green button pressed")
                    } label: {
                        Text("Green")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .frame(width: 140, height: 120)
                            .background(.green)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }

                    Button {
                        print("Red button pressed")
                    } label: {
                        Text("Red")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .frame(width: 140, height: 120)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }

                HStack(spacing: 12) {
                    Button {
                        print("Yellow button pressed")
                    } label: {
                        Text("Yellow")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .frame(width: 140, height: 120)
                            .background(.yellow)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }

                    Button {
                        print("Blue button pressed")
                    } label: {
                        Text("Blue")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .frame(width: 140, height: 120)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
            }

            Button("Start Game") {
                let newColor = Int.random(in: 0...3)
                sequence.append(newColor)

                switch newColor {
                case 0:
                    currentColor = "Green"
                case 1:
                    currentColor = "Red"
                case 2:
                    currentColor = "Yellow"
                case 3:
                    currentColor = "Blue"
                default:
                    currentColor = "None"
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
