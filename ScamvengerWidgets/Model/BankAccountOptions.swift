//
//  BankAccountOptions.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import SwiftUI
import AppIntents

enum BankAccountOptions: String, AppEnum {
    case current = "Current"
    case savings = "Savings"
    case investment = "Investment"
    case salary = "Salary"
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        "Widget Option"
    }
    
    static var caseDisplayRepresentations: [BankAccountOptions: DisplayRepresentation] {
        [
            .current: "Current",
            .savings: "Savings",
            .investment: "Investment",
            .salary: "Salary"
        ]
    }
    
    var data: [Date : Double] {
        switch self {
        case .current:
            return [
                Date().addingTimeInterval(-86400 * 10) : 52748,
                Date().addingTimeInterval(-86400 * 9) : 45485,
                Date().addingTimeInterval(-86400 * 8) : 37017,
                Date().addingTimeInterval(-86400 * 7) : 35794,
                Date().addingTimeInterval(-86400 * 6) : 31405,
                Date().addingTimeInterval(-86400 * 5) : 31290,
                Date().addingTimeInterval(-86400 * 4) : 20927,
                Date().addingTimeInterval(-86400 * 3) : 14723,
                Date().addingTimeInterval(-86400 * 2) : 10428,
                Date().addingTimeInterval(-86400 * 1) : 8289,
                Date() : 62000
            ]
        case .savings:
            return [
                Date().addingTimeInterval(-86400 * 365 * 5) : 10000,
                Date().addingTimeInterval(-86400 * 365 * 4) : 11000,
                Date().addingTimeInterval(-86400 * 365 * 3) : 12100,
                Date().addingTimeInterval(-86400 * 365 * 2) : 13310,
                Date().addingTimeInterval(-86400 * 365 * 1) : 14641,
                Date() : 16105.10
            ]
        case .investment:
            return [
                Date().addingTimeInterval(-86400 * 10) : 52748,
                Date().addingTimeInterval(-86400 * 9) : 45485,
                Date().addingTimeInterval(-86400 * 8) : 37017,
                Date().addingTimeInterval(-86400 * 7) : 40045,
                Date().addingTimeInterval(-86400 * 6) : 31405,
                Date().addingTimeInterval(-86400 * 5) : 35423,
                Date().addingTimeInterval(-86400 * 4) : 20927,
                Date().addingTimeInterval(-86400 * 3) : 14723,
                Date().addingTimeInterval(-86400 * 2) : 10428,
                Date().addingTimeInterval(-86400 * 1) : 8289,
                Date() : 13723
            ]
        case .salary:
            return [:]
        }
    }
    
    var color: Color {
        switch self {
        case .current:
            return .blue
        case .savings:
            return .blue
        case .investment:
            return .red
        case .salary:
            return .clear
        }
    }
}
