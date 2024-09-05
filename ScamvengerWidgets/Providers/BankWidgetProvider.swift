//
//  BankWidgetProvider.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import SwiftUI
import AppIntents
import WidgetKit

struct BankWidgetProvider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> BankWidgetEntry {
        BankWidgetEntry(date: Date(), configuration: BankAccountOptionsIntent())
    }

    func snapshot(for configuration: BankAccountOptionsIntent, in context: Context) async -> BankWidgetEntry {
        BankWidgetEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: BankAccountOptionsIntent, in context: Context) async -> Timeline<BankWidgetEntry> {
        var entries: [BankWidgetEntry] = []
        
        let entry = BankWidgetEntry(date: .now, configuration: configuration)
        entries.append(entry)

        return Timeline(entries: entries, policy: .atEnd)
    }
}
