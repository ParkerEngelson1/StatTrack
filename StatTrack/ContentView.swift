//
//  ContentView.swift
//  StatTrack
//
//  Created by Parker Engelson on 2/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var points = 0
    @State private var shots = 0
    @State private var rebounds = 0
    @State private var assists = 0
    @State private var steals = 0
    @State private var blocks = 0
    @State private var turnovers = 0
    @State private var fouls = 0
    
    @State private var shootingPercent = 0.0
   var body: some View {
        CounterButton()
        
    }
}

struct CounterButton: View {
    @State private var count = 0

    var body: some View {
        Button(action: {
            count += 1
        }) {
            Text("\(count)")
                .font(.largeTitle)
                .padding()
        }
        .onLongPressGesture {
            count = 0
        }
    }
}
#Preview {
    ContentView()
}
