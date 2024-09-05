//
//  ScamvengerWidgetsBundle.swift
//  ScamvengerWidgets
//
//  Created by Tristan Chay on 4/9/24.
//

import WidgetKit
import SwiftUI

@main
struct ScamvengerWidgetsBundle: WidgetBundle {
    var body: some Widget {
        VaultWidget()
        Puzzle()
        BankWidget()
        CatWidget()
    }
}
