//
//  BankWidget.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import SwiftUI
import WidgetKit

struct BankWidget: Widget {
    let kind: String = "Bank"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: BankAccountOptionsIntent.self, provider: BankWidgetProvider()) { entry in
            BankWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemMedium])
    }
}
