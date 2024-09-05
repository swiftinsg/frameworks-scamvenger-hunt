//
//  VaultState.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import Foundation
import WidgetKit

struct VaultWidgetEntry: TimelineEntry {
    var date: Date
    let state: VaultState
    let password: Int
    
    enum VaultState: Int {
        case locked = 0
        case password = 1
        case unlocked = 2
    }
}
