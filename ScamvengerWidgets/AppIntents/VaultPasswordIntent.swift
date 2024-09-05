//
//  VaultPasswordIntent.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import Foundation
import AppIntents

struct VaultPasswordIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Password"
    
    @Parameter(title: "Code")
    var code: String
    
    init() {
        
    }
    
    init(code: String) {
        self.code = code
    }
    
    func perform() async throws -> some IntentResult {
        let store = UserDefaults.vaultStore
        let currentInt = store.integer(forKey: "currentPassword")
        if code != "delete" && code != "check" {
            store.set(Int(String(currentInt) + code), forKey: "currentPassword")
        } else if code == "delete" {
            let currentStringPassword = String(currentInt)
            store.set(Int(String(currentStringPassword.dropLast())), forKey: "currentPassword")
        } else if code == "check" {
            if currentInt == 5348 {
                store.set(0, forKey: "currentPassword")
                store.set(2, forKey: "vaultState")
            }
        }
        return .result()
    }
}
