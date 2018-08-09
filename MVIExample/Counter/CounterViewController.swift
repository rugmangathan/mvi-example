//
//  CounterViewController.swift
//  MVIExample
//
//  Created by Rugmangathan on 04/01/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import UIKit
import RxSwift

class CounterViewController: MviController<CounterState> {
  @IBOutlet weak var clicksLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!
  @IBOutlet weak var incrementButton: UIButton!
  @IBOutlet weak var decrementButton: UIButton!
  
  private lazy var intentions: CounterIntentions = {
    return CounterIntentions(
            incrementButton.rx.tap.asObservable(),
            decrementButton.rx.tap.asObservable()
    )
  }()

  private lazy var renderer = {
    return CounterViewRenderer(self)
  }()

  override func bind(states: Observable<CounterState>) -> Observable<CounterState> {
    return CounterModel
      .bind(intentions, lifecycle.asObservable(), states)
  }

  override func setup() {
    super.setup()
    title = "Counter"
  }

  override func effects(state: CounterState) {
    renderer.render(state)
  }
}

extension CounterViewController: CounterView {
  func showCounterValues(_ count: Int64, _ clicks: Int64) {
    countLabel.text = "\(count)"
    clicksLabel.text = "\(clicks)"
  }
}
