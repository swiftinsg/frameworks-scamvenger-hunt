//
//  DebugMenuView.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 6/9/24.
//

import SwiftUI

struct DebugMenuView: View {
    
    @State private var completeStation: Station = .coreHapticsAndNearbyInteractions
    
    @Environment(Game.self) private var game
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Picker("Current Station", selection: Binding(get: {
                        game.currentStation
                    }, set: { newValue in
                        withAnimation {
                            game.currentStation = newValue
                        }
                    })) {
                        Section("Uncompleted Activities") {
                            ForEach(Station.allCases, id: \.hashValue) { station in
                                if !game.completedStations.contains(station) {
                                    Text(station.frameworks)
                                        .tag(station)
                                }
                            }
                        }
                        Section("Completed Activities") {
                            ForEach(Station.allCases, id: \.hashValue) { station in
                                if game.completedStations.contains(station) {
                                    Text(station.frameworks)
                                        .tag(station)
                                }
                            }
                        }
                    }
                }
                
                Section {
                    Picker("Mark Station as Complete", selection: $completeStation) {
                        ForEach(Station.allCases, id: \.hashValue) { station in
                            Text(station.frameworks)
                                .tag(station)
                        }
                    }
                    
                    Button("Mark Station") {
                        game.completedStations.insert(completeStation)
                    }
                }
                
                Section {
                    Button("Exit to Home Page") {
                        withAnimation {
                            game.state = .playingIdle
                        }
                    }
                }
            }
            .navigationTitle("Debug Menu")
        }
    }
}

#Preview {
    DebugMenuView()
}
