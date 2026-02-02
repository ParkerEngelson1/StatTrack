//
//  ContentView.swift
//  StatTrack
//
//  Created by Parker Engelson on 2/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var player1 = Player(name: "Alice", stats: StatLine())
    @State private var player2 = Player(name: "Bob", stats: StatLine())
    
    var body: some View {
        
    }
}
struct StatLine {
    var points = 0
    var shots = 0
    var rebounds = 0
    var assists = 0
    var steals = 0
    var blocks = 0
    var turnovers = 0
    var fouls = 0
    var shootingPercent = 0.0
}

struct Player {
    var name: String
    var stats: StatLine
}

struct PlayerStatsView: View {
    @Binding var stats: StatLine
    
    var body: some View {
        VStack(spacing: 12) {
            statRow(label: "Points", value: $stats.points)
            statRow(label: "Shots", value: $stats.shots)
            statRow(label: "Rebounds", value: $stats.rebounds)
            statRow(label: "Assists", value: $stats.assists)
            statRow(label: "Steals", value: $stats.steals)
            statRow(label: "Blocks", value: $stats.blocks)
            statRow(label: "Turnovers", value: $stats.turnovers)
            statRow(label: "Fouls", value: $stats.fouls)
        }
    }
    
    private func statRow(label: String, value: Binding<Int>) -> some View {
        HStack {
            Text(label)
                .frame(width: 40, alignment: .leading)
            CounterButton(value: value)
        }
    }
}
struct CounterButton: View {
    @Binding var value: Int
    
    var body: some View {
        Button {
            value += 1
        } label: {
            Text("\(value)")
                .font(.title)
                .padding()
        }
        .onLongPressGesture {
            value = 0
        }
    }
}

#Preview {
    ContentView()
}
