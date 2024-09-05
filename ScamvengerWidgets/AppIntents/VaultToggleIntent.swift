//
//  VaultToggleIntent.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import Foundation
import AppIntents

struct VaultToggleIntent: AppIntent {
    static var title: LocalizedStringResource = "Toggle"
    
    func perform() async throws -> some IntentResult {
        let store = UserDefaults.vaultStore
        let currentInt = store.integer(forKey: "vaultState")
        if currentInt == 0 {
            store.set(1, forKey: "vaultState")
        } else if currentInt == 1 {
            store.set(2, forKey: "vaultState")
        } else {
            store.set(0, forKey: "vaultState")
        }
        return .result()
    }
}
