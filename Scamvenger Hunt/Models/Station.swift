//
//  Station.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import Foundation
import SwiftUI

enum Station: String, CaseIterable, Equatable {
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
            Hint(text: "I found Sean’s iPad.\nYou can collect it from me here.",
                 image: Image("HintToaPayoh"), imageAlignment: .bottomTrailing)
        case .spriteKitAndCoreMotion:
            "The police found a map left behind by Sean that displays where he hid some of his $oons. Their search has led them to the **313** - find out where the $oons are hidden."
        case .accessibility: "We’ve caught Sean’s accomplice whilst he was shopping at the _first Apple Store in Singapore_, but we can't get any data out of his device - we need your help to dig deeper."
        case .arKit: "It seems Sean left behind some clues on his whereabouts whilst having his lunch after the robbery."
        case .pencilKit: "The police have requested your help to assist in the case. Go over to the neighbourhood police centre by taking _seven stops towards Dhoby Ghaut_, and then _one stop towards Marina South Pier_, where the robbery was first reported."
        case .swiftCharts: "Sean has left his receipts all over Singapore. Scan them and analyse his $oon spending to find out more information about the robbery."
        }
    }
    
    var stationQRContent: String {
        switch self {
        case .coreHapticsAndNearbyInteractions: "https://swiftin.sg/1fL2iK"
        case .mapKit: "https://swiftin.sg/rOPEQ9"
        case .userNotificationsAndWidgetKit: "https://swiftin.sg/SnvoBH"
        case .spriteKitAndCoreMotion: "https://swiftin.sg/yBo7kS"
        case .accessibility: "https://swiftin.sg/DuEHLe"
        case .arKit: "https://swiftin.sg/TFUMpP"
        case .pencilKit: "https://swiftin.sg/H0EPxG"
        case .swiftCharts: ""
        }
    }
    
    var frameworks: String {
        switch self {
        case .coreHapticsAndNearbyInteractions: "CoreHaptics & NearbyInteractions"
        case .mapKit: "MapKit"
        case .userNotificationsAndWidgetKit: "UserNotifications & WidgetKit"
        case .spriteKitAndCoreMotion: "SpriteKit & CoreMotion"
        case .accessibility: "Accessibility"
        case .arKit: "ARKit"
        case .pencilKit: "PencilKit"
        case .swiftCharts: "SwiftCharts"
        }
    }
}
