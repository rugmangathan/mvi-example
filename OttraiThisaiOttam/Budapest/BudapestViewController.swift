//
// Copyright © 2017 Rugmangathan. All rights reserved.
//
// Unauthorized copying of this file, via any medium is strictly prohibited.
// Proprietary and confidential.
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
  private let greetText = "Hello,"
  private let strangerText = "Stranger"

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
    greetingLabel.text = "\(greetText) \(strangerText)"
  }

  func greet(_ message: String) {
    greetingLabel.text = "\(greetText) \(message)"
  }
}
