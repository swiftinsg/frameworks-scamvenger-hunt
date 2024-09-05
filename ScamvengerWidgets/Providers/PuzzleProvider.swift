//
//  PuzzleProvider.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import Foundation
import WidgetKit

struct PuzzleProvider: TimelineProvider {
    func placeholder(in context: Context) -> PuzzleEntry {
        PuzzleEntry(date: Date(), string: "")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (PuzzleEntry) -> ()) {
        let entry = PuzzleEntry(date: Date(), string: "")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = PuzzleEntry(date: Date(), string: "")
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}
