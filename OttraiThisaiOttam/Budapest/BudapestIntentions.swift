//
// Copyright © 2017 Rugmangathan. All rights reserved.
//
// Unauthorized copying of this file, via any medium is strictly prohibited.
// Proprietary and confidential.
//

import RxSwift

class BudapestIntentions {
  let textFieldChanges: Observable<String?>
  
  init(textFieldChanges: Observable<String?>) {
    self.textFieldChanges = textFieldChanges
  }
  
  func textChanges() -> Observable<String> {
    return textFieldChanges
      .filter { $0 != nil }
      .map { $0! }
  }
}
