//
//  ContentView.swift
//  Scamvenger UserNotifications WidgetKit
//
//  Created by Tristan Chay on 3/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var notifications = Notifications()
    
    var body: some View {
        VStack {
            Text("Only press the button when the group is ready, pass the iPad to them immediately after pressing the button.")
                .font(.title)
                .multilineTextAlignment(.center)
            Button("Schedule Notifications") {
                notifications.sendNewBatch()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView()
}
