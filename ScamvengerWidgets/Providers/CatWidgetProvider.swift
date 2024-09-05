//
//  CatProvider.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import Foundation
import WidgetKit

struct CatWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> CatWidgetEntry {
        CatWidgetEntry(date: Date(), string: "")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (CatWidgetEntry) -> ()) {
        let entry = CatWidgetEntry(date: Date(), string: "")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = CatWidgetEntry(date: Date(), string: "")
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}
