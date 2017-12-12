//
//  CounterModelTests.swift
//  OttraiThisaiOttamTests
//
//  Created by Rugmangathan on 11/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import Cuckoo

@testable import OttraiThisaiOttam
let disposeBag = DisposeBag()

class CounterModelTests: XCTestCase {
  func testShouldEmitInitialState_whenCreated() {
    // Setup
    let observer = TestScheduler(initialClock: 0)
      .createObserver(CounterState.self)

    CounterModel
      .bind()
      .subscribe(observer)
      .disposed(by: disposeBag)

    // Assert
    let expectedValues = [
      next(0, CounterState(count: 0, clicks: 0)),
      completed(0)
    ]
    XCTAssertEqual(observer.events, expectedValues)
  }
}
