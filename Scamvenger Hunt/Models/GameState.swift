//
//  GameState.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import Foundation

enum GameState: Equatable {
    case setUp
    case playingIdle
    case playing(Station)
    case success(Station)
}
