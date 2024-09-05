//
//  BankAccountOptionsIntent.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import Foundation
import AppIntents

struct BankAccountOptionsIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Select an Account"
    
    @Parameter(title: "Account Type", default: BankAccountOptions.current)
    var option: BankAccountOptions
    
    func perform() async throws -> some IntentResult {
        .result()
    }
}
