//
//  ContentView.swift
//  StatTrack
//
//  Created by Parker Engelson on 2/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var john = Player(name: "John", stats: StatLine())
    @State private var oliver = Player(name: "Oliver", stats: StatLine())
    @State private var eric = Player(name: "Eric", stats: StatLine())
    @State private var carter = Player(name: "Carter", stats: StatLine())
    @State private var carson = Player(name: "Carson", stats: StatLine())
    @State private var ryan = Player(name: "Ryan", stats: StatLine())
    @State private var henry = Player(name: "Henry", stats: StatLine())
    @State private var charlie = Player(name: "Charlie", stats: StatLine())
    @State private var johnjohn = Player(name: "JohnJohn", stats: StatLine())
    
    var body: some View {
        Text("🥞 StatTrack V1.0 🥞")
            .font(Font.largeTitle)
            .bold()
            .italic()
            .padding()        
        ScrollView {
            HStack {
                Text("John")
                    .bold()
                PlayerStatsView(stats: $john.stats)
            }
            .font(.system(size: 20))
            .padding(10)
            Text("---------------------------------------------------------------------------------------")
            HStack {
                Text("Oliver")
                    .bold()
                PlayerStatsView(stats: $oliver.stats)
            }
            .font(.system(size: 20))
            .padding(10)
            Text("---------------------------------------------------------------------------------------")
            HStack {
                Text("Eric")
                    .bold()
                PlayerStatsView(stats: $eric.stats)
            }
            .font(.system(size: 20))
            .padding(10)
            Text("---------------------------------------------------------------------------------------")
            HStack {
                Text("Carter")
                    .bold()
                PlayerStatsView(stats: $carter.stats)
            }
            .font(.system(size: 20))
            .padding(10)
            Text("---------------------------------------------------------------------------------------")
            HStack {
                Text("Carson")
                    .bold()
                PlayerStatsView(stats: $carson.stats)
            }
            .font(.system(size: 19))
            .padding(10)
            Text("---------------------------------------------------------------------------------------")
            HStack {
                Text("Ryan")
                    .bold()
                PlayerStatsView(stats: $ryan.stats)
            }
            .font(.system(size: 20))
            .padding(10)
            Text("---------------------------------------------------------------------------------------")
            HStack {
                Text("Henry")
                    .bold()
                PlayerStatsView(stats: $henry.stats)
            }
            .font(.system(size: 20))
            .padding(10)
            Text("---------------------------------------------------------------------------------------")
            HStack {
                Text("Charlie")
                    .bold()
                PlayerStatsView(stats: $charlie.stats)
            }
            .font(.system(size: 19))
            .padding(10)
            Text("---------------------------------------------------------------------------------------")
            HStack {
                Text("JohnJohn")
                    .bold()
                PlayerStatsView(stats: $johnjohn.stats)
            }
            .font(.system(size: 18))
            .padding(10)
            Text("Built by peng 🥞")
        }
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
        HStack {
            Text("PTS:")
            CounterButton(value: $stats.points)
            Text("ST:")
            CounterButton(value: $stats.shots)
            Text("REB:")
            CounterButton(value: $stats.rebounds)
            Text("AST:")
            CounterButton(value: $stats.assists)
            Text("STL:")
            CounterButton(value: $stats.steals)
            Text("BLK:")
            CounterButton(value: $stats.blocks)
            Text("TOs:")
            CounterButton(value: $stats.turnovers)
            Text("FL:")
            CounterButton(value: $stats.fouls)
        }
    }
}

struct CounterButton: View {
    @Binding var value: Int
    var body: some View {
        Button {
            value += 1
        } label: {
            Text("\(value)  ")
                .font(.title)
            
        }
        .onLongPressGesture {
            value = 0
        }
    }
}

#Preview {
    ContentView()
}
