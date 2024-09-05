//
//  VaultWidgetProvider.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import Foundation
import WidgetKit

struct VaultWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> VaultWidgetEntry {
        VaultWidgetEntry(date: Date(), state: .locked, password: 0)
    }

    func getSnapshot(in context: Context, completion: @escaping (VaultWidgetEntry) -> ()) {
        let store = UserDefaults.vaultStore
        let stateInt = store.integer(forKey: "vaultState")
        let password = store.integer(forKey: "currentPassword")
        let entry = VaultWidgetEntry(date: Date(), state: VaultWidgetEntry.VaultState.init(rawValue: stateInt) ?? .locked, password: password)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let store = UserDefaults.vaultStore
        let stateInt = store.integer(forKey: "vaultState")
        let password = store.integer(forKey: "currentPassword")
        let entry = VaultWidgetEntry(date: Date(), state: VaultWidgetEntry.VaultState.init(rawValue: stateInt) ?? .locked, password: password)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}
