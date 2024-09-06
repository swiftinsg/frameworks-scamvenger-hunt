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
    
    private let fakeNotifications: [(String, String)] = [
        ("Candy Crush", "Your lives have been refilled. Ready for another round?"),
        ("Soonstagram", "jiachenyee has requested to follow you."),
        ("Bank of Soonville", "Incoming transfer of $62000 from Shaun"),
        ("Music", "New album released: Soon's Greatest Hits."),
        ("Soonpee", "DONT MISS OUT ON THE NEW 9/9 SALES!"),
        ("Reminders", "Remember to remind yourself to stop setting reminders."),
        ("Weather", "It’s raining cats and dogs. Literally. Look outside."),
        ("Siri", "I’ve seen your web history. Let’s just pretend this never happened."),
        ("$oonBook", "Your friend just posted a picture of their sandwich. Again."),
        ("Shaun", "Hope you wiped your iPad before the police siezed it, we can't risk them finding out where we kept the $oons!"),
        ("Secure Vault Pro Max", "Vault password due for change. Current password: *******."),
        ("$oonTube", "New video posted by $oonFan99."),
        ("Maps", "Traffic is light on your way to the gym."),
        ("Calendar", "Meeting with Bob at 5 PM."),
        ("Calendar", "Birthday reminder: John’s birthday today."),
        ("App Store", "Update available for 5 apps."),
        ("Reminders", "Don’t forget to water your plants."),
        ("Siri Suggestions", "Order pizza from your favorite place?"),
        ("App Store", "Install more apps! Your iPad isn’t full yet!"),
        ("Health", "You’ve burned 0 calories today. Impressive!"),
        ("$oonstagram", "Your post just got a like… from your mom."),
        ("Music", "Play ‘Eye of the Tiger.’ It’s time to conquer your laundry."),
        ("Photos", "Memory: 5 years ago, you took a blurry photo of your thumb."),
        ("Maps", "You’re lost again. But at least you’re consistent!"),
        ("Fitness", "You’ve been sitting for 3 hours. Are you OK?"),
        ("Calendar", "Your cat’s birthday is today. Don’t forget to buy tuna."),
        ("Mail", "You’ve subscribed to 100 newsletters. Time to unsubscribe?"),
        ("Reminders", "Eat your vegetables. No seriously, you need this."),
        ("Fitness", "Your step count is so low today, we’re calling it ‘couch count.’"),
        ("Mail", "Inbox zero! Just kidding, 1,234 unread emails."),
        ("Mail", "Congratulations! You've won a free vacation."),
        ("$oonstagram", "New like on your post from User123."),
        ("Fitness", "You’re only 10 minutes away from your daily goal."),
        ("Photos", "Memory from last year: Your trip to the mountains."),
        ("$oonstagram", "No one liked your last post. Try harder next time."),
        ("Fitness", "Remember, abs are made in the kitchen. So are cookies."),
        ("Calendar", "Your meeting has been canceled. Go back to bed."),
        ("Health", "Heart rate? More like snack rate!"),
        ("Mail", "Delete this email if you dare. Just kidding, it’s spam."),
        ("Siri", "You don’t need help. You need a nap."),
        ("Weather", "Rain is coming. Dance while you still can."),
        ("$oonBook", "You’ve been tagged in a photo. Brace yourself."),
        ("Music", "Why not listen to some smooth jazz while ignoring your tasks?"),
        ("Photos", "Here’s a picture of your dog judging you. Enjoy."),
        ("Reminders", "Reminder: Breathe in, breathe out. Repeat as necessary."),
        ("Calendar", "Your next event: Absolutely nothing."),
        ("Mail", "Free Wi-Fi at this location. Or just stay home."),
        ("Fitness", "10 steps today. Try not to overdo it."),
        ("Health", "Time to stand up!"),
        ("Game Center", "Your friend just beat your high score."),
        ("Email", "Reminder: Your subscription is about to expire."),
        ("Weather", "It’s cold outside. Wear 12 layers or hibernate."),
        ("Siri", "I can’t help you with your life choices, but I can order pizza."),
        ("App Store", "Download more games. Productivity is overrated."),
        ("Game Center", "You’ve been beaten by a 7-year-old. Time to level up."),
        ("Reminders", "It’s 3 AM. Perfect time to reflect on embarrassing memories."),
        ("Weather", "It's sunny in $oonville!"),
        ("Fitness", "You’ve completed your standing goal for today."),
        ("Weather", "There’s a 100% chance of procrastination today."),
        ("Siri", "I’ve seen worse decisions. Not many, but a few."),
        ("Music", "Your playlist is mostly sad songs. You OK?"),
    ]
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in }
    }
    
    func sendNewBatch() {
        self.stop()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.scheduleHints()
            self.scheduleFakeNotifications()
        }
    }
    
    private func scheduleHints() {
        self.scheduleNotification(title: "Police", body: "We need your help to gather information from Sean's iPad! Try finding out information from the Widgets he has or Notifications that may appear.", seconds: 9)
        self.scheduleNotification(title: "Police", body: "We've cracked the code! Read the note carefully.", seconds: 209)
        self.scheduleNotification(title: "Police", body: "Hmm... try piecing together the first word of each bulleted item in the note.", seconds: 389)
    }
    
    private func scheduleFakeNotifications() {
        var seconds = TimeInterval(14)
        for notification in fakeNotifications {
            self.scheduleNotification(title: notification.0, body: notification.1, seconds: seconds)
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
    
    func stop() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
