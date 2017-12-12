//
//  CounterModel.swift
//  OttraiThisaiOttam
//
//  Created by Rugmangathan on 11/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import RxSwift

class CounterModel {
  static func bind() -> Observable<CounterState> {
    return Observable.just(CounterState(count: 0, clicks: 0))
  }
}
