//
//  CatIntent.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 6/9/24.
//

import Foundation
import UserNotifications
import AppIntents

struct CatIntent: AppIntent {
    static var title: LocalizedStringResource = "Cat"
    
    func perform() async throws -> some IntentResult {
        let content = UNMutableNotificationContent()
        content.title = "Meow"
        content.body = "Pommy cat says hallo."
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        do {
            try await UNUserNotificationCenter.current().add(request)
        } catch {
            print("error")
        }
        return .result()
    }
}
