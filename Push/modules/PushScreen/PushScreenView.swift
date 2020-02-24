//
//  PushScreenView.swift
//  Push
//
//  Created by mhlee on 2020/02/24.
//  Copyright © 2020 mhlee. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class PushScreenView: UIViewController, PushScreenViewProtocol {
  private var disposeBag = DisposeBag()
  
  var viewModel: PushScreenViewModelProtocol? {
    didSet {
      setupBind()
    }
  }
          
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
        
    DispatchQueue.main.async { [weak self] in
      self?.setupBind()
      self?.viewModel?.viewDidLoad()
    }
  }
  
  private func setupBind() {
    disposeBag = DisposeBag()
  }
}
