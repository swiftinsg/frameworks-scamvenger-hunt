//
//  Station.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import Foundation
import SwiftUI

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
    
    var hint: Hint {
        switch self {
        case .coreHapticsAndNearbyInteractions:
            Hint(image: Image("HintCreditCard"))
        case .mapKit:
            "Sean went on a shopping spree after the robbery. Track down his biggest purchases, starting from Plaza Singapura."
        case .userNotificationsAndWidgetKit:
            Hint(text: "I found Sean’s iPad. You can collect it from me here.",
                 image: Image("HintToaPayoh"), imageAlignment: .bottomTrailing)
        case .spriteKitAndCoreMotion: "arrow.up.and.down.and.arrow.left.and.right"
        case .accessibility: "accessibility"
        case .arKit: "arkit"
        case .pencilKit: "applepencil.and.scribble"
        case .swiftCharts: "chart.xyaxis.line"
        }
    }
}
