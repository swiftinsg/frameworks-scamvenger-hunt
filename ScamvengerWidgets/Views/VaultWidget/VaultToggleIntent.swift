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
        let currentInt = vaultSharedDefaults.integer(forKey: "vaultState")
        if currentInt == 0 {
            vaultSharedDefaults.set(1, forKey: "vaultState")
        } else if currentInt == 1 {
            vaultSharedDefaults.set(2, forKey: "vaultState")
        } else {
            vaultSharedDefaults.set(0, forKey: "vaultState")
        }
        return .result()
    }
}
