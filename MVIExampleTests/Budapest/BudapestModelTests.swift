//
//  BudapestModelTests.swift
//  MVIExampleTests
//
//  Created by Rugmangathan on 10/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import RxBlocking
import RxCocoa

@testable import MVIExample

class BudapestModelTests: XCTestCase {
  var disposable: Disposable!
  var testObserver: TestableObserver<BudapestState>!
  var nameChanges: PublishRelay<String>!

  override func setUp() {
    super.setUp()
    testObserver = TestScheduler(initialClock: 0).createObserver(BudapestState.self)
    nameChanges = PublishRelay<String>()
    let intentions = BudapestIntentions(nameChanges.asObservable())
    disposable = BudapestModel()
      .bind(intentions: intentions)
      .subscribe(testObserver)
  }

  override func tearDown() {
    disposable.dispose()
    super.tearDown()
  }

  func testShouldEmitStrangerState_whenNameIsEmpty() {
    // Act
    nameChanges.accept("")

    // Assert
    let expectedEvent = [
      Recorded.next(0, BudapestState(""))
    ]
    XCTAssertEqual(testObserver.events, expectedEvent)
  }

  func testShouldEmitGreetingState_whenNameChanges() {
    // Act
    nameChanges.accept("RMK")

    // Assert
    let expectedEvents = [
      Recorded.next(0, BudapestState("RMK"))
    ]
    XCTAssertEqual(testObserver.events, expectedEvents)
  }
}
