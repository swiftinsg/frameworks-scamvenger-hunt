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
        let currentInt = vaultSharedDefaults.integer(forKey: "currentPassword")
        if code != "delete" && code != "check" {
            vaultSharedDefaults.set(Int(String(currentInt) + code), forKey: "currentPassword")
        } else if code == "delete" {
            var currentStringPassword = String(currentInt)
            vaultSharedDefaults.set(Int(String(currentStringPassword.dropLast())), forKey: "currentPassword")
        } else if code == "check" {
            if currentInt == 5348 {
                vaultSharedDefaults.set(0, forKey: "currentPassword")
                vaultSharedDefaults.set(2, forKey: "vaultState")
            }
        }
        return .result()
    }
}
