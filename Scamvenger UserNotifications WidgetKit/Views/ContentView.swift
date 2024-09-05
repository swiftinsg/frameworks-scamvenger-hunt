//
//  ContentView.swift
//  Scamvenger UserNotifications WidgetKit
//
//  Created by Tristan Chay on 3/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = ""
    @State private var showingControls = false
    @State private var notifications = Notifications()
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        VStack {
            if !showingControls {
                Text("Station master's controls. If you're a student, this is not part of the activity. Exit the app.")
                HStack {
                    SecureField("Enter password", text: $text)
                        .frame(width: 200)
                        .textFieldStyle(.roundedBorder)
                    Button("Enter") {
                        if text == "sigma" {
                            withAnimation {
                                showingControls = true
                                text = ""
                            }
                        }
                    }
                }
            } else {
                Text("Only press the button when the group is ready, pass the iPad to them immediately after pressing the button.")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Button("Schedule Notifications") {
                    notifications.sendNewBatch()
                }
                .buttonStyle(.borderedProminent)
                Button("Stop Notifications", role: .destructive) {
                    notifications.stop()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .onChange(of: scenePhase) {
            if scenePhase != .active {
                withAnimation {
                    showingControls = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
