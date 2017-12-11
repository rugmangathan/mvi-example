//
// Copyright © 2017 Rugmangathan. All rights reserved.
//
// Unauthorized copying of this file, via any medium is strictly prohibited.
// Proprietary and confidential.
//

import Foundation

class BudapestState: Equatable {
  let name: String

  init(_ message: String) {
    self.name = message
  }

  static func ==(lhs: BudapestState, rhs: BudapestState) -> Bool {
    return lhs.name == rhs.name
  }
}
