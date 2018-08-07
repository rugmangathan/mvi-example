//
//  CounterState.swift
//  MVIExample
//
//  Created by Rugmangathan on 11/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import UIKit

class CounterState: MviState {
  var count: Int64
  var clicks: Int64

  init(count: Int64 = 0, clicks: Int64 = 0) {
    self.count = count
    self.clicks = clicks
  }

  required init(_ state: CounterState) {
    self.count = state.count
    self.clicks = state.clicks
  }

  static func ==(lhs: CounterState, rhs: CounterState) -> Bool {
    return lhs.count == rhs.count
      && lhs.clicks == rhs.clicks
  }
}
