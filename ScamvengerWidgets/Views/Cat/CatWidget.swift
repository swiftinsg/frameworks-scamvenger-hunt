//
//  CatWidget.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import SwiftUI
import WidgetKit

struct CatWidget: Widget {
    let kind: String = "Cat"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CatWidgetProvider()) { entry in
            CatWidgetEntryView(entry: entry)
                .containerBackground(for: .widget) {
                    Button(intent: CatIntent()) {
                        Image("cat")
                    }
                    .buttonStyle(.plain)
                }
        }
        .supportedFamilies([.systemExtraLarge])
    }
}
