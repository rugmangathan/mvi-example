//
//  Strings+Ex.swift
//  MVIExample
//
//  Created by Rugmangathan on 02/01/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

class BudapestState: Equatable {
  let name: String

  init(_ message: String) {
    self.name = message
  }

  static func == (lhs: BudapestState, rhs: BudapestState) -> Bool {
    return lhs.name == rhs.name
  }
}
