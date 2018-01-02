//
//  BudapestModelTests.swift
//  OttraiThisaiOttamTests
//
//  Created by Rugmangathan on 10/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import RxBlocking
import RxCocoa

@testable import OttraiThisaiOttam

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
      next(0, BudapestState(""))
    ]
    XCTAssertEqual(testObserver.events, expectedEvent)
  }

  func testShouldEmitGreetingState_whenNameChanges() {
    // Act
    nameChanges.accept("RMK")

    // Assert
    let expectedEvents = [
      next(0, BudapestState("RMK"))
    ]
    XCTAssertEqual(testObserver.events, expectedEvents)
  }

  func testShouldRemoveTrailingWhiteSpaces_whenNameHasTrailingWhitespaces() {
    // Setup
    let actual = "Rugmangathan   "

    // Assert
    let expected = "Rugmangathan"
    XCTAssertEqual(BudapestModel().toDisplayName(actual), expected)
  }

  func testShouldRemoveExtraWhitespacesInBetweenName_whenNameHasMoreThanOneWhiteSpacesInBetween() {
    // Setup
    let actual = "Rugmangathan   M K"

    // Assert
    let expected = "Rugmangathan M K"
    XCTAssertEqual(BudapestModel().toDisplayName(actual), expected)
  }
}
