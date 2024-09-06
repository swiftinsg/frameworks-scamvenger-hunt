//
//  Game.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import Foundation
import Observation
import SwiftUI

@Observable
class Game {
    
    var namespace: Namespace.ID?
    
    var players: [Player] = []
    var state: GameState = .setUp {
        didSet {
            if state == .playingIdle && currentPlayer == nil,
               !players.isEmpty {
                setCurrentPlayer(to: 0)
            }
        }
    }
    
    var groupName: String = ""
    
    private(set) var currentPlayerIndex: Int?
    private(set) var currentPlayerStartDate: Date?
    
    var currentPlayer: Player? {
        if let currentPlayerIndex {
            players[currentPlayerIndex]
        } else {
            nil
        }
    }
    
    var currentPlayerEndDate: Date? {
        currentPlayerStartDate?.addingTimeInterval(60)
    }
    
    var accentColor: Color {
        currentPlayer?.color.color ?? .blue
    }
    
    var completedStations: Set<Station> = []
    var currentStation: Station? = .accessibility
    
    func setCurrentPlayer(to index: Int) {
        currentPlayerIndex = index
        currentPlayerStartDate = .now
        
        Timer.scheduledTimer(withTimeInterval: abs(currentPlayerEndDate!.timeIntervalSinceNow), repeats: false) { _ in
            withAnimation {
                var nextPlayerIndex = self.currentPlayerIndex! + 1
                if nextPlayerIndex == self.players.count {
                    nextPlayerIndex = 0
                }
                
                self.setCurrentPlayer(to: nextPlayerIndex)
            }
        }
    }
    
    func stationCompleted(_ station: Station) {
        withAnimation {
            state = .success(station)
            completedStations.insert(station)
        }
    }
    
    init() {
        // Skip intro if simulator
//#if targetEnvironment(simulator)
        players = Player.PlayerColor.allCases.map({
            Player(color: $0)
        })
        groupName = "Sample Group Name"
        state = .playingIdle
//#endif
    }
}
