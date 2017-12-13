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
import RxCocoa
import Cuckoo

@testable import OttraiThisaiOttam
let disposeBag = DisposeBag()

class CounterModelTests: XCTestCase {
//  func testShouldEmitInitialState_whenCreated() {
//    // Setup
//    let incrementClicks = PublishRelay<Void>()
//    let intentions = CounterIntentions(incrementClicks.asObservable())
//    let observer = TestScheduler(initialClock: 0)
//      .createObserver(CounterState.self)
//
//    CounterModel
//      .bind(intentions)
//      .subscribe(observer)
//      .disposed(by: disposeBag)
//
//    // Assert
//    let expectedEvents = [
//      next(0, CounterState(count: 0, clicks: 0))
//    ]
//    XCTAssertEqual(observer.events, expectedEvents)
//  }

  func testShouldIncreaseCountAndClicks_whenUserTapsPlusButton() {
    // Setup
    let incrementEvents = PublishRelay<Void>()
    let decrementClicks = PublishRelay<Void>()
    let intentions = CounterIntentions(incrementEvents.asObservable(),
                                       decrementClicks.asObservable())
    let observer = TestScheduler(initialClock: 0)
      .createObserver(CounterState.self)

    CounterModel
      .bind(intentions)
      .subscribe(observer)
      .disposed(by: disposeBag)

    // Act
    incrementEvents.accept(())

    // Assert
    let expectedEvents = [
      next(0, CounterState(count: 1, clicks: 1))
    ]
    XCTAssertEqual(observer.events, expectedEvents)
  }

  func testShouldDecreaseCountAndIncrementClicks_whenUSerTapsMinusButton() {
    // Setup
    let incrementClicks = PublishRelay<Void>()
    let decrementClicks = PublishRelay<Void>()
    let intentions = CounterIntentions(incrementClicks.asObservable(),
                                       decrementClicks.asObservable())
    let observer = TestScheduler(initialClock: 0)
      .createObserver(CounterState.self)

    CounterModel
      .bind(intentions)
      .subscribe(observer)
      .disposed(by: disposeBag)

    // Act
    decrementClicks.accept(())

    // Assert
    let expectedEvents = [
      next(0, CounterState(count: -1, clicks: 1))
    ]
    XCTAssertEqual(observer.events, expectedEvents)
  }
}
