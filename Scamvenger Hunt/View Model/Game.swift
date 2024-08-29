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
    // for testing
//    var players: [Player] = Player.PlayerColor.allCases.map { Player(color: $0) }
    var players: [Player] = []
    var state: GameState = .setUp {
        didSet {
            if state == .playingIdle && currentPlayer == nil,
               !players.isEmpty {
                setCurrentPlayer(to: 0)
            }
        }
    }
    
    var groupName: String = "Potato Potato"
    
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
        currentPlayerStartDate?.addingTimeInterval(300)
    }
    
    var accentColor: Color {
        currentPlayer?.color.color ?? .red
    }
    
    var completedStations: Set<Station> = []
    
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
    
    init() {
        #warning("for testing")
        setCurrentPlayer(to: 0)
    }
}
