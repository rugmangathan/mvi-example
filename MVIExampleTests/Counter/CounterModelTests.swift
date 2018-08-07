//
//  CounterModelTests.swift
//  MVIExampleTests
//
//  Created by Rugmangathan on 11/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import RxCocoa
import Cuckoo

@testable import MVIExample
let disposeBag = DisposeBag()

class CounterModelTests: XCTestCase {
  var incrementEvents: PublishRelay<Void>!
  var decrementClicks: PublishRelay<Void>!
  var lifecycle: PublishRelay<MviLifecycle>!
  var observer: TestableObserver<CounterState>!
  var states: PublishRelay<CounterState>!

  override func setUp() {
    super.setUp()
    incrementEvents = PublishRelay()
    decrementClicks = PublishRelay()
    let intentions = CounterIntentions(incrementEvents.asObservable(),
                                       decrementClicks.asObservable())
    observer = TestScheduler(initialClock: 0)
      .createObserver(CounterState.self)

    CounterModel
      .bind(intentions, lifecycle.asObservable(), states.asObservable())
      .subscribe(observer)
      .disposed(by: disposeBag)
  }

  func testShouldReturnInitialState_whenViewLoads() {
    // Act
    lifecycle.accept(.created)

    // Assert
    let expectedEvents = [
      next(0, CounterState(count: 0, clicks: 0))
    ]
    XCTAssertEqual(observer.events, expectedEvents)
  }

  func testShouldIncreaseCountAndClicks_whenUserTapsPlusButton() {
    // Act
    incrementEvents.accept(())

    // Assert
    let expectedEvents = [
      next(0, CounterState(count: 1, clicks: 1))
    ]
    XCTAssertEqual(observer.events, expectedEvents)
  }
 
  func testShouldDecreaseCountAndIncrementClicks_whenUSerTapsMinusButton() {
    // Act
    decrementClicks.accept(())

    // Assert
    let expectedEvents = [
      next(0, CounterState(count: -1, clicks: 1))
    ]
    XCTAssertEqual(observer.events, expectedEvents)
  }

  func testShouldEmitZeroCount_whenUserTapsOneIncrementAndDecrementClicks() {
    // Act
    incrementEvents.accept(())
    decrementClicks.accept(())

    // Assert
    let expectedEvents = [
      next(0, CounterState(count: 1, clicks: 1)),
      next(0, CounterState(count: 0, clicks: 2))
    ]
    XCTAssertEqual(observer.events, expectedEvents)
  }
}
