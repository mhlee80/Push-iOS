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
  
  private lazy var titleLabel: UILabel = {
    let v = UILabel()
    v.backgroundColor = .white
    v.textColor = .black
    v.font = .systemFont(ofSize: 48)
    v.text = "Push"
    return v
  }()
    
  private lazy var requestNotificationAuthorization: UIButton = {
    let v = UIButton()
    v.backgroundColor = .white
    v.layer.borderWidth = 1
    v.layer.cornerRadius = 24
    v.layer.borderColor = UIColor.black.cgColor
    v.setTitleColor(.black, for: .normal)
    v.titleLabel?.font = .systemFont(ofSize: 18)
    v.setTitle("Request notification authorization", for: .normal)
    return v
  }()
  
  private lazy var registerNotification: UIButton = {
    let v = UIButton()
    v.backgroundColor = .white
    v.layer.borderWidth = 1
    v.layer.cornerRadius = 24
    v.layer.borderColor = UIColor.black.cgColor
    v.setTitleColor(.black, for: .normal)
    v.titleLabel?.font = .systemFont(ofSize: 18)
    v.setTitle("Register notification", for: .normal)
    return v
  }()
  
  override func viewDidLoad() {
    view.backgroundColor = .white
    
    view.addSubview(titleLabel)
    view.addSubview(requestNotificationAuthorization)
    view.addSubview(registerNotification)
    
    titleLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().offset(100)
    }

    requestNotificationAuthorization.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.bottom.equalTo(registerNotification.snp.top).offset(-20)
      make.size.equalTo(CGSize(width: 280, height: 48))
    }
    
    registerNotification.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.bottom.equalToSuperview().offset(-20)
      make.size.equalTo(CGSize(width: 280, height: 48))
    }
    
    DispatchQueue.main.async { [weak self] in
      self?.viewModel?.viewDidLoad()
    }
  }
  
  private func setupBind() {
    disposeBag = DisposeBag()
    
    requestNotificationAuthorization.rx.tap.subscribe(onNext: { [weak self] in
        self?.viewModel?.requestNotificationAuthorization()
    }).disposed(by: disposeBag)
    
    registerNotification.rx.tap.subscribe(onNext: { [weak self] in
        self?.viewModel?.registerRemoteNotification()
    }).disposed(by: disposeBag)
  }
}
