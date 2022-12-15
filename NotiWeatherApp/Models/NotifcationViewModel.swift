//
//  NotifcationViewModel.swift
//  NotiWeatherApp
//
//  Created by Bryan Sánchez Peralta on 15/12/22.
//

import Foundation
import UserNotifications

struct NotificationViewModel {
    let content: UNMutableNotificationContent
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .badge, .sound]
        ) { success, error in
            if let error = error { print(error.localizedDescription) }
        }
        
        content = UNMutableNotificationContent()
        content.title = "Weather Now"
        content.sound = UNNotificationSound.default
    }
    
    func requestNotification(subtitle: String) {
        content.subtitle = subtitle
        
        UNUserNotificationCenter.current().add(
            UNNotificationRequest(
                identifier: UUID().uuidString,
                content: content,
                trigger: UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            )
        )
    }
}
