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
  var intentions: CounterIntentions!
  private let initialState = CounterState(count: 0, clicks: 0)

  override func setUp() {
    super.setUp()
    incrementEvents = PublishRelay()
    decrementClicks = PublishRelay()
    lifecycle = PublishRelay<MviLifecycle>()
    states = PublishRelay<CounterState>()
    intentions = CounterIntentions(incrementEvents.asObservable(),
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
    states.accept(initialState)

    // Assert
    let expectedEvents = [
      next(0, initialState)
    ]
    XCTAssertEqual(observer.events, expectedEvents)
  }

  func testShouldIncreaseCountAndClicks_whenUserTapsPlusButton() {
    // Act
    lifecycle.accept(.created)
    states.accept(initialState)
    incrementEvents.accept(())

    // Assert
    let incrementedState = CounterState(count: 1, clicks: 1)
    let expectedEvents = [
      next(0, initialState),
      next(0, incrementedState)
    ]
    XCTAssertEqual(observer.events, expectedEvents)
  }
 
  func testShouldDecreaseCountAndIncrementClicks_whenUserTapsMinusButton() {
    // Act
    lifecycle.accept(.created)
    states.accept(initialState)
    decrementClicks.accept(())

    // Assert
    let expectedEvents = [
      next(0, initialState),
      next(0, CounterState(count: -1, clicks: 1))
    ]
    XCTAssertEqual(observer.events, expectedEvents)
  }

  func testShouldEmitZeroCount_whenUserTapsOneIncrementAndDecrementClicks() {
    // Setup
    let incrementedState = CounterState(count: 1, clicks: 1)

    // Act
    lifecycle.accept(.created)
    states.accept(initialState)
    incrementEvents.accept(())
    states.accept(incrementedState)
    decrementClicks.accept(())

    // Assert
    let expectedEvents = [
      next(0, initialState),
      next(0, incrementedState),
      next(0, CounterState(count: 0, clicks: 2))
    ]
    XCTAssertEqual(observer.events, expectedEvents)
  }

  func testShouldRestoreProviousState_whenViewRestores() {
    // Setup
    let incrementedState = CounterState(count: 1, clicks: 1)
    let decrementedState = CounterState(count: 0, clicks: 2)

    // Act
    lifecycle.accept(.created)
    states.accept(initialState)
    incrementEvents.accept(())
    states.accept(incrementedState)
    decrementClicks.accept(())
    states.accept(decrementedState)
    lifecycle.accept(.restored)

    // Assert
    let expectedEvents = [
      next(0, initialState),
      next(0, incrementedState),
      next(0, decrementedState),
      next(0, decrementedState)
    ]
    XCTAssertEqual(observer.events, expectedEvents)
  }
}
