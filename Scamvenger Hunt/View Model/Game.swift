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
    var players: [Player] = Player.PlayerColor.allCases.map { Player(color: $0) }
    var state: GameState = .playingIdle {
        didSet {
            if state == .playingIdle && currentPlayer == nil,
               let player = players.first {
                setCurrentPlayer(to: player)
            }
        }
    }
    
    var groupName: String = "Potato Potato"
    
    private(set) var currentPlayer: Player?
    private(set) var currentPlayerStartDate: Date?
    var currentPlayerEndDate: Date? {
        currentPlayerStartDate?.addingTimeInterval(300)
    }
    
    var accentColor: Color {
        currentPlayer?.color.color ?? .red
    }
    
    var completedStations: Set<Station> = []
    
    func setCurrentPlayer(to player: Player) {
        currentPlayer = player
        currentPlayerStartDate = .now
    }
    
    init() {
        #warning("for testing")
        setCurrentPlayer(to: players.first!)
    }
}
