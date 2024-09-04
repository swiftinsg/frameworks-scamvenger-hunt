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
        "Candy Crush" : "Your lives have been refilled. Ready for another round?",
        "Soonstagram" : "jiachenyee has requested to follow you.",
        "Bank of Soonville" : "Incoming transfer of $62000 from Shaun",
        "Music" : "New album released: Soon's Greatest Hits.",
        "Soonpee" : "DONT MISS OUT ON THE NEW 9/9 SALES!",
        "Shaun" : "Hope you wiped your iPad before the police siezed it, we can't risk them finding out where we kept the $oons!",
        "Secure Vault Pro Max" : "Vault password due for change. Current password: 5348."
    ]
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in }
    }
    
    func sendNewBatch() {
        self.removeAllNotifications()
        var seconds = TimeInterval(5)
        for notification in notifications {
            self.scheduleNotification(title: notification.key, body: notification.value, seconds: seconds)
            seconds += 5
        }
    }
    
    private func scheduleNotification(title: String, subtitle: String = "", body: String, seconds: TimeInterval = 5) {
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
