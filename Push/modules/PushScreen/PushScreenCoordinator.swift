//
//  PushScreenCoordinator.swift
//  Push
//
//  Created by mhlee on 2020/02/24.
//  Copyright © 2020 mhlee. All rights reserved.
//

import Foundation
import UIKit

class PushScreenCoordinator: NSObject, PushScreenCoordinatorProtocol {
  static func createModule() -> UIViewController & PushScreenViewProtocol {
    let view = PushScreenView()
    let viewModel = PushScreenViewModel()
    view.viewModel = viewModel

    return view
  }
}
