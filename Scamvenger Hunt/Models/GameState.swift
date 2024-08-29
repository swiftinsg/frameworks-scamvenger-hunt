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
}

enum Station: CaseIterable, Equatable {
    case coreHapticsAndNearbyInteractions
    case mapKit
    case userNotificationsAndWidgetKit
    case spriteKitAndCoreMotion
    case accessibility
    case arKit
    case pencilKit
    case swiftCharts
    
    var icon: String {
        switch self {
        case .coreHapticsAndNearbyInteractions: "iphone.radiowaves.left.and.right"
        case .mapKit: "map"
        case .userNotificationsAndWidgetKit: "bell.badge"
        case .spriteKitAndCoreMotion: "arrow.up.and.down.and.arrow.left.and.right"
        case .accessibility: "accessibility"
        case .arKit: "arkit"
        case .pencilKit: "applepencil.and.scribble"
        case .swiftCharts: "chart.xyaxis.line"
        }
    }
}
