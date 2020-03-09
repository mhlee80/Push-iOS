//
//  PushService.swift
//  Push
//
//  Created by mhlee on 2020/03/09.
//  Copyright © 2020 mhlee. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class PushService: NSObject {
  static let shared = PushService()

  private override init() {
    super.init()
  }
  
  func requestNotificationAuthorization(completion: @escaping (_ granted: Bool, Error?) -> Void) {
    UNUserNotificationCenter.current().delegate = self

    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
    UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: completion)
  }
  
  func registerForRemoteNotification() {
    UIApplication.shared.registerForRemoteNotifications()
  }
}

extension AppDelegate {
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    let deviceTokenString = deviceToken.map { String(format: "%02x", $0) }.joined()
    log.info("token: \(deviceTokenString)")
  }

  func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    log.info("error")
  }
}

extension PushService: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    log.info("foreground, you received a message: \(notification.request.content.userInfo)")
    
    completionHandler([.alert, .badge, .sound])
  }
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    log.info("background, you clicked a message: \(response.notification.request.content.userInfo)")
    
    if response.actionIdentifier == UNNotificationDismissActionIdentifier {
      // on message dismissed
    }
    
    if response.actionIdentifier == UNNotificationDefaultActionIdentifier {
      // on messaged clicked
    }
    
    completionHandler()
  }
}
