//
//  ContentView.swift
//  Simon Game
//
//  Created by Christian Collins on 10/13/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("SIMON")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Remember the pattern!")
                .font(.headline)
            Button(action: {}) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.green)
                    .frame(width: 140, height: 140)
            }
            .buttonStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
