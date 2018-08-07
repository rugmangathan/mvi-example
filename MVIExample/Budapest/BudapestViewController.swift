//
//  Strings+Ex.swift
//  MVIExample
//
//  Created by Rugmangathan on 02/01/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class BudapestViewController: UIViewController {
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var greetingLabel: UILabel!

  private lazy var intentions: BudapestIntentions = {
    return BudapestIntentions(
      nameTextField.rx
        .text
        .asObservable()
        .filter { $0 != nil }
        .map { $0! }
    )
  }()

  private lazy var viewRenderer: BudapestViewRenderer = {
    return BudapestViewRenderer(self)
  }()

  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()

    BudapestModel()
      .bind(intentions: intentions)
      .subscribe (onNext: { state in
        self.viewRenderer.render(state)
      })
      .disposed(by: disposeBag)
  }
}

extension BudapestViewController: BudapestView {
  func greetStranger() {
    greetingLabel.text = String(format: "Greet".localized(), "Stranger".localized())
  }

  func greet(_ message: String) {
    greetingLabel.text = String(format: "Greet".localized(), message)
  }
}
