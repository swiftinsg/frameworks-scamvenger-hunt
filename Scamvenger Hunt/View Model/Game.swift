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
    var state: GameState = .playingIdle
    
    var groupName: String = "Potato Potato"
    
    var currentPlayer: Player?
    var currentPlayerStartDate: Date?
    
    var accentColor: Color {
        currentPlayer?.color.color ?? .red
    }
    
    var completedStations: Set<Station> = []
}
