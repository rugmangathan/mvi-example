//
// Copyright © 2017 Rugmangathan. All rights reserved.
//
// Unauthorized copying of this file, via any medium is strictly prohibited.
// Proprietary and confidential.
//

import RxSwift

class BudapestIntentions {
  let nameTextFieldChanges: Observable<String>
  
  init(_ nameTextFieldChanges: Observable<String>) {
    self.nameTextFieldChanges = nameTextFieldChanges
  }
  
  func enterName() -> Observable<String> {
    return nameTextFieldChanges
  }
}
