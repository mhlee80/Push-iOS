//
//  PushScreenViewModel.swift
//  Push
//
//  Created by mhlee on 2020/02/24.
//  Copyright © 2020 mhlee. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PushScreenViewModel: NSObject, PushScreenViewModelProtocol {
  var messages = PublishSubject<[String]>()
  
  func viewDidLoad() {
    log.info("")
  }
  
  func requestNotificationAuthorization() {
    PushService.shared.requestNotificationAuthorization { granted, error in
      log.info("granted: \(granted)")
      if let error = error {
        log.info(error)
      }
    }
  }
  
  func registerRemoteNotification() {
    PushService.shared.registerForRemoteNotification()
  }
}
