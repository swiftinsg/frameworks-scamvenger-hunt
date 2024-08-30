//
//  StationView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct StationView: View {
    
    var station: Station
    
    var body: some View {
        switch station {
        case .coreHapticsAndNearbyInteractions:
            CoreHapticsAndNearbyInteractionsView()
        case .mapKit:
            MapKitView()
        case .userNotificationsAndWidgetKit:
            UserNotificationsAndWidgetKitView()
        case .spriteKitAndCoreMotion:
            SpriteKitAndCoreMotionView()
        case .accessibility:
            AccessibilityView()
        case .arKit:
            ARKitView()
        case .pencilKit:
            PencilKitView()
        case .swiftCharts:
            EmptyView()
        }
    }
}
