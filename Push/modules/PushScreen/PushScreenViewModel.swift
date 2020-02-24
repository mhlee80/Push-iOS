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
}
