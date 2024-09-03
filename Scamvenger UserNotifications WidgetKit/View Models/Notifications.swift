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
        
        for notification in notifications {
            self.scheduleNotification(title: notification.key, subtitle: notification.value)
        }
    }
    
    private func scheduleNotification(title: String, subtitle: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    private func removeAllNotifications() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
