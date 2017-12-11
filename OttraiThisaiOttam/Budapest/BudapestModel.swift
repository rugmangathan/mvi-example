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
      .map { self.toDisplayName($0) }
      .map { BudapestState($0) }
  }

  func toDisplayName(_ name: String) -> String {
    var name = name
    let pattern = "\\s+"
    do {
      let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
      let range = NSRange(location: 0, length: name.count)
      name = regex.stringByReplacingMatches(in: name,
                                            options: [],
                                            range: range,
                                            withTemplate: " ")
      return name.trimmingCharacters(in: .whitespaces)
    } catch let error {
      print(error.localizedDescription)
      return name
    }
  }
}
