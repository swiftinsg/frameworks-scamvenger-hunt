//
//  ContentView.swift
//  Scamvenger UserNotifications WidgetKit
//
//  Created by Tristan Chay on 3/9/24.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @State private var notifications = Notifications()
    
    var body: some View {
        VStack {
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
        .padding()
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
