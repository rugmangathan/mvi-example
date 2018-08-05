//
//  CounterIntentions.swift
//  OttraiThisaiOttamTests
//
//  Created by Rugmangathan on 12/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import RxSwift

class CounterIntentions {
  let incrementClicks: Observable<Void>
  let decrementClicks: Observable<Void>

  init(_ incrementClicks: Observable<Void>,
       _ decrementClicks: Observable<Void>) {
    self.incrementClicks = incrementClicks
    self.decrementClicks = decrementClicks
  }

  func increment() -> Observable<Int64> {
    return incrementClicks.map { 1 }
  }

  func decrement() -> Observable<Int64> {
    return decrementClicks.map { -1 }
  }
}
