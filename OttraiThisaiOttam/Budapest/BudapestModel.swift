//
// Copyright © 2017 Rugmangathan. All rights reserved.
//
// Unauthorized copying of this file, via any medium is strictly prohibited.
// Proprietary and confidential.
//

import RxSwift

class BudapestModel {
  func bind(intentions: BudapestIntentions) -> Observable<BudapestState> {
    return intentions
      .textChanges()
      .map { BudapestState($0) }
  }
}
