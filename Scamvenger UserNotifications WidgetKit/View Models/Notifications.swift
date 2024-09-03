//
//  Notifications.swift
//  Scamvenger UserNotifications WidgetKit
//
//  Created by Tristan Chay on 3/9/24.
//

import Foundation
import UserNotifications

@Observable
class Notifications {
    
    private let notifications: [String : String] = [
        "TITLE" : "SUBTITLE",
        "sig" : "ma"
    ]
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in }
    }
    
    func sendNewBatch() {
        self.removeAllNotifications()
        
        self.scheduleNotification(
            title: "Police",
            body: "Hey, we found Sean's iPad. Try digging around the Widgets and Notifications on his iPad to gather more information about the heist.",
            seconds: 15
        )
        for notification in notifications {
            self.scheduleNotification(title: notification.key, body: notification.value)
        }
    }
    
    private func scheduleNotification(title: String, subtitle: String = "", body: String, seconds: TimeInterval = 60) {
        let content = UNMutableNotificationContent()
        content.title = title
        if !subtitle.isEmpty {
            content.subtitle = subtitle
        }
        content.body = body
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    private func removeAllNotifications() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
