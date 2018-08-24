//
//  CounterModel.swift
//  MVIExample
//
//  Created by Rugmangathan on 11/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import RxSwift

class CounterModel {
  static func bind(_ intentions: CounterIntentions,
                   _ lifecycle: Observable<MviLifecycle>,
                   _ states: Observable<CounterState>) -> Observable<CounterState> {
    let initialState = CounterState(count: 0, clicks: 0)

    let createdLifecycleStates = lifecycle
      .filter { $0 == .created }
      .flatMapLatest { _ -> Observable<CounterState> in
        return Observable.just(initialState)
    }

    let restoresLifecycleStates = lifecycle
      .filter { $0 == .restored }
      .withLatestFrom(states) { (_, state: CounterState) -> CounterState in
        return state
    }

    let incrementedState = intentions
      .increment()
      .withLatestFrom(states) { (value: Int64, state: CounterState) -> CounterState in
        let copiedState = CounterState(state)
        copiedState.clicks += 1
        copiedState.count += value
        return copiedState
      }

    let decrementedState = intentions
      .decrement()
      .withLatestFrom(states) { (value: Int64, state: CounterState) -> CounterState in
        let copiedState = CounterState(state)
        copiedState.clicks += 1
        copiedState.count += value
        return copiedState
      }

    return Observable
      .merge(createdLifecycleStates,
             restoresLifecycleStates,
             incrementedState,
             decrementedState)
  }
}
