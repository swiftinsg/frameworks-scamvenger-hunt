//
//  SecondWidget.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 4/9/24.
//

import WidgetKit
import SwiftUI
import AppIntents

struct VaultWidget: Widget {
    let kind: String = "Vault"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: VaultWidgetProvider()) { entry in
            VaultWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemLarge])
    }
}
