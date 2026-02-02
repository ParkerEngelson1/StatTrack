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
        Text("🥞 StatTrack V1.1 🥞") // title
            .font(Font.largeTitle)
            .bold()
            .italic()
            .padding()        
        ScrollView { // allows scroll
            HStack { // Hstack for each line
                Text("John")
                    .bold()
                PlayerStatsView(stats: $john.stats) // pastes stat line
            }
            .font(.system(size: 20))
            .padding(10)
           Divider()
            HStack {
                Text("Oliver")
                    .bold()
                PlayerStatsView(stats: $oliver.stats)
            }
            .font(.system(size: 20))
            .padding(10)
            Divider()
            HStack {
                Text("Eric")
                    .bold()
                PlayerStatsView(stats: $eric.stats)
            }
            .font(.system(size: 20))
            .padding(10)
            Divider()
            HStack {
                Text("Carter")
                    .bold()
                PlayerStatsView(stats: $carter.stats)
            }
            .font(.system(size: 20))
            .padding(10)
            Divider()
            HStack {
                Text("Carson")
                    .bold()
                PlayerStatsView(stats: $carson.stats)
            }
            .font(.system(size: 19))
            .padding(10)
            Divider()
            HStack {
                Text("Ryan")
                    .bold()
                PlayerStatsView(stats: $ryan.stats)
            }
            .font(.system(size: 20))
            .padding(10)
            Divider()
            HStack {
                Text("Henry")
                    .bold()
                PlayerStatsView(stats: $henry.stats)
            }
            .font(.system(size: 20))
            .padding(10)
            Divider()
            HStack {
                Text("Charlie")
                    .bold()
                PlayerStatsView(stats: $charlie.stats)
            }
            .font(.system(size: 19))
            .padding(10)
            Divider()
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

struct StatLine { // var holder
    var points = 0
    var shots = 0
    var rebounds = 0
    var assists = 0
    var steals = 0
    var blocks = 0
    var turnovers = 0
    var fouls = 0
}

struct Player { // object
    var name: String
    var stats: StatLine
}

struct PlayerStatsView: View { // each line of player, holds buttons interprets statline
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
                .foulHighlight(fouls: stats.fouls) // calls color change
        }
    }
}

struct CounterButton: View { // button to press, goes up by 1 each click, hold to reset to 0
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

struct FoulHighlightModifier: ViewModifier { // modifies the fouls to be red when 4
    let fouls: Int
    func body(content: Content) -> some View {
        content
            .foregroundColor(fouls >= 4 ? .red : .primary)            
            .animation(.easeInOut, value: fouls)
    }
}

extension View {
    func foulHighlight(fouls: Int) -> some View {
        self.modifier(FoulHighlightModifier(fouls: fouls))
    }
}

#Preview {
    ContentView()
}
