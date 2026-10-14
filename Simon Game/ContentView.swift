//
//  ContentView.swift
//  Simon Game
//
//  Created by Christian Collins on 10/13/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("SIMON")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Remember the pattern!")
                .font(.headline)

            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    colorButton(.green)
                    colorButton(.red)
                }

                HStack(spacing: 12) {
                    colorButton(.yellow)
                    colorButton(.blue)
                }
            }
        }
        .padding()
    }

    func colorButton(_ color: Color) -> some View {
        Button(action: {}) {
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
