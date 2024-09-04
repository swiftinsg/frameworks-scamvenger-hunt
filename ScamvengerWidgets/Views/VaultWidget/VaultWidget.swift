//
//  SecondWidget.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 4/9/24.
//

import WidgetKit
import SwiftUI
import AppIntents

let vaultSharedDefaults = UserDefaults(suiteName: "org.swiftinsg.Scamvenger-UserNotifications-WidgetKit.ScamvengerWidgets.vault")!

struct VaultWidget: Widget {
    let kind: String = "InteractiveWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: VaultWidgetProvider()) { entry in
            VaultWidgetEntryView(entry: entry)
                .containerBackground(.white.gradient, for: .widget)
        }
        .configurationDisplayName("Vault Widget")
        .description("Store your secrets here")
        .supportedFamilies([.systemLarge])
    }
}
