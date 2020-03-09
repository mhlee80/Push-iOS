//
//  PushScreenProtocols.swift
//  Push
//
//  Created by mhlee on 2020/02/24.
//  Copyright © 2020 mhlee. All rights reserved.
//

import Foundation
import RxSwift

protocol PushScreenCoordinatorProtocol {
  static func createModule() -> UIViewController & PushScreenViewProtocol
}

protocol PushScreenViewProtocol {
  var viewModel: PushScreenViewModelProtocol? { get set }
}

protocol PushScreenViewModelProtocol {
  var messages: PublishSubject<[String]> { get }
  func viewDidLoad()
  
  func requestNotificationAuthorization()
  func registerRemoteNotification()
}
