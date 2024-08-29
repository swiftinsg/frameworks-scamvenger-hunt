//
//  BadgesCardView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI

struct BadgesCardView: View {
    
    var body: some View {
        CardView(title: "Badges") {
            VStack(alignment: .center) {
                HStack {
                    BadgeView(station: .accessibility)
                    BadgeView(station: .arKit)
                    BadgeView(station: .coreHapticsAndNearbyInteractions)
                }
                HStack {
                    BadgeView(station: .mapKit)
                    BadgeView(station: .pencilKit)
                }
                HStack {
                    BadgeView(station: .spriteKitAndCoreMotion)
                    BadgeView(station: .swiftCharts)
                    BadgeView(station: .userNotificationsAndWidgetKit)
                }
            }
        }
    }
}

#Preview {
    BadgesCardView()
}
