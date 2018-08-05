//
//  CounterViewController.swift
//  MVIExample
//
//  Created by Rugmangathan on 04/01/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import UIKit
import RxSwift

class CounterViewController: UIViewController {
  @IBOutlet weak var clicksLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!
  @IBOutlet weak var incrementButtton: UIButton!
  @IBOutlet weak var decrementButton: UIButton!
  
  private lazy var intentions: CounterIntentions = {
    return CounterIntentions(incrementButtton.rx.tap.asObservable(),
                             decrementButton.rx.tap.asObservable())
  }()

  private lazy var renderer = {
    return CounterViewRenderer(self)
  }()

  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()

    CounterModel
      .bind(intentions)
      .subscribe(onNext: { state in
        self.renderer.render(state)
      })
      .disposed(by: disposeBag)
  }
}

extension CounterViewController: CounterView {
  func showCounterValues(_ count: Int64, _ clicks: Int64) {
    countLabel.text = "\(count)"
    clicksLabel.text = "\(clicks)"
  }
}
