//
//  Puzzle.swift
//  Puzzle
//
//  Created by Jia Chen Yee on 6/6/23.
//

import WidgetKit
import SwiftUI
import AppIntents

struct Puzzle: Widget {
    let kind: String = "Puzzle"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: PuzzleProvider()) { entry in
            PuzzleEntryView(entry: entry)
        }
        .supportedFamilies([.systemLarge])
    }
}
