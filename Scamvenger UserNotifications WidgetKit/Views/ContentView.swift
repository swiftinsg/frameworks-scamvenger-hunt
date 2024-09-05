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
                Text("Check that you've done these before handing the iPad over to a new group:")
                    .font(.title3)
                Text("1) Locked the vault widget\n2) Reset the puzzle widget (click on the empty square)\n3) Clicked the \"Start Activity\" button before closing this app.")
                HStack {
                    Button("Start Activity") {
                        notifications.sendNewBatch()
                    }
                    .buttonStyle(.borderedProminent)
                    Button("Stop Notifications", role: .destructive) {
                        notifications.stop()
                    }
                    .buttonStyle(.borderedProminent)
                }
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
