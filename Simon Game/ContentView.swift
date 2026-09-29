//
//  ContentView.swift
//  Simon Game
//
//  Created by Christian Collins on 9/29/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Simon")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Watch the pattern")
                .foregroundStyle(.secondary)

            Button {
                print("Green button pressed")
            } label: {
                Text("Green")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(width: 120, height: 120)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }

            Button("Start Game") {
                print("Game started")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
