//
//  Strings+Ex.swift
//  MVIExample
//
//  Created by Rugmangathan on 02/01/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift

class BudapestModel {
  func bind(intentions: BudapestIntentions) -> Observable<BudapestState> {
    return intentions
      .enterName()
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
