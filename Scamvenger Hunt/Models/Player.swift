//
//  Player.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import Foundation
import UIKit
import SwiftUI

struct Player: Identifiable {
    var id = UUID()
    var profilePicture: UIImage?
    var color: PlayerColor
    
    enum PlayerColor: Int, CaseIterable {
        case red
        case orange
        case yellow
        case green
        case blue
        
        var color: Color {
            switch self {
            case .red: .red
            case .orange: .orange
            case .yellow: .yellow
            case .green: .green
            case .blue: .blue
            }
        }
    }
}

