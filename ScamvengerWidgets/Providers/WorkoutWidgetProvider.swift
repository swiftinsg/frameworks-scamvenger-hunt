//
//  CatProvider.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import Foundation
import WidgetKit

struct WorkoutWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> WorkoutWidgetEntry {
        WorkoutWidgetEntry(date: Date(), string: "")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WorkoutWidgetEntry) -> ()) {
        let entry = WorkoutWidgetEntry(date: Date(), string: "")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = WorkoutWidgetEntry(date: Date(), string: "")
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}
