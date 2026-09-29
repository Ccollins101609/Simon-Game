//
//  ContentView.swift
//  Simon Game
//
//  Created by Christian Collins on 9/29/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Simon")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Press Start to play")
                    .foregroundStyle(.secondary)
                
                Button("Start Game") {
                    print("Game started")
                }
            }
            .padding()
        }
    }
}

    #Preview {
        ContentView()
    }
