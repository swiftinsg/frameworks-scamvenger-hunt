//
//  Player.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import Foundation
import UIKit
import SwiftUI

struct Player: Identifiable, Equatable {
    var id = UUID()
    var profilePicture: UIImage?
    var color: PlayerColor
    
    enum PlayerColor: Int, CaseIterable, Equatable {
        case red = 0
        case green = 1
        case blue = 2
        case purple = 3
        
        var color: Color {
            switch self {
            case .red: .red
            case .purple: .purple
            case .green: .green
            case .blue: .blue
            }
        }
    }
}
