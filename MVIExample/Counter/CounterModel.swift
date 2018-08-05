//
//  CounterModel.swift
//  OttraiThisaiOttam
//
//  Created by Rugmangathan on 11/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import RxSwift

class CounterModel {
  static func bind(_ intentions: CounterIntentions) -> Observable<CounterState> {
    return Observable
      .merge(intentions.increment(), intentions.decrement())
      .scan(CounterState()) { (oldState, newValue) in
        let clicks = oldState.clicks + 1
        let count = oldState.count + newValue
        return CounterState(count: count, clicks: clicks)
    }
  }
}
