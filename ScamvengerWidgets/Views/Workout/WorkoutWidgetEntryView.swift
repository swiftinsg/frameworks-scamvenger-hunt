//
//  CatWidgetEntryView.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import SwiftUI

struct WorkoutWidgetEntryView: View {
    var entry: WorkoutWidgetEntry
    
    var body: some View {
        VStack {
            Text("Sean's Last Workout")
                .font(.title2)
            Spacer()
            Image(systemName: "figure.run.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 140)
                .foregroundStyle(.green, .green.opacity(0.2))
            Spacer()
            Text("01:34:29")
                .font(.title)
                .fontWeight(.bold)
            Text("10km - 600kcal")
        }
        .fontDesign(.monospaced)
        .padding()
    }
}
