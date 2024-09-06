//
//  ContentView.swift
//  Scamvenger UserNotifications WidgetKit
//
//  Created by Tristan Chay on 3/9/24.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @State private var text = ""
    @State private var showingControls = false
    @State private var notifications = Notifications()
    
    @State private var showingSheet = true
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        VStack {
            if showingControls {
                Text("Start/Reset the activity before handing the iPad over to the new group.")
                HStack {
                    Button("Start/Reset Activity") {
                        Task {
                            await resetWidgets()
                        }
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
                    showingSheet = true
                }
            }
        }
        .sheet(isPresented: $showingSheet) {
            ZStack(alignment: .top) {
                Text("Station master's controls. If you're a student, this is not part of the activity. Exit the app.")
                    .multilineTextAlignment(.center)
                    .padding()
                PasscodeView { result in
                    showingControls = result
                    showingSheet = false
                }
            }
        }
        .onChange(of: showingSheet) {
            if !showingControls {
                showingSheet = true
            }
        }
    }
    
    func resetWidgets() async {
        do {
            let _ = try await ShuffleAppIntent().perform()
        } catch {
            print("error")
        }
        UserDefaults.vaultStore.set(0, forKey: "vaultState")
        WidgetCenter.shared.reloadAllTimelines()
    }
}

#Preview {
    ContentView()
}
