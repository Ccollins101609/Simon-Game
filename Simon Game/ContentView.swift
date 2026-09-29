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
            
            VStack(spacing: 12) {
                
                HStack(spacing: 12) {
                    // Green
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
                    
                    // Red
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
                    // Yellow
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
                    
                    // Blue
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
                print("Game started")
            }
        }
        .padding()
    }
}
    
    #Preview {
        ContentView()
    }
