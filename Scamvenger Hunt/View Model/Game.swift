//
//  Game.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import Foundation
import Observation

@Observable
class Game {
    var players: [Player] = []
    var state: GameState = .setUp
    
    var currentPlayer: Player?
    var currentPlayerStartDate: Date?
}
