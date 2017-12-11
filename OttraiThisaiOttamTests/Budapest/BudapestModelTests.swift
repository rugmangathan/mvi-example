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
  let disposeBag = DisposeBag()
  var testObserver: TestableObserver<BudapestState>!
  var nameChanges: PublishRelay<String?>!

  override func setUp() {
    super.setUp()
    testObserver = TestScheduler(initialClock: 0).createObserver(BudapestState.self)
    nameChanges = PublishRelay<String?>()
    let intentions = BudapestIntentions(textFieldChanges: nameChanges.asObservable())
    BudapestModel()
      .bind(intentions: intentions)
      .subscribe(testObserver)
      .disposed(by: disposeBag)
  }

  func testShouldEmitStrangerState_whenNameIsEmpty() {
    // Fake events
    nameChanges.accept("")

    // Assert
    let expectedEvent = [
      next(0, BudapestState("")),
    ]
    XCTAssertEqual(testObserver.events, expectedEvent)
  }

  func testShouldEmitGreetingState_whenNameChanges() {
    // Fake Events
    nameChanges.accept("RMK")

    // Assert
    let expectedEvents = [
      next(0, BudapestState("RMK"))
    ]
    XCTAssertEqual(testObserver.events, expectedEvents)
  }

  func testShouldRemoveWhitespaces_whenNameHasOnlyWhitespaces() {
    // Setup
    let actual = "  "

    // Assert
    let expected = ""
    XCTAssertEqual(BudapestModel().removeWhitespaces(actual), expected)
  }

  func testShouldRemoveLeadingSpaces_whenNameHasLeadingWhitespaces() {
    // Setup
    let actual = "   Rugmangathan"

    // Assert
    let expected = "Rugmangathan"
    XCTAssertEqual(BudapestModel().removeWhitespaces(actual), expected)
  }

  func testShouldRemoveLeadingWhiteSpaces_whenNameHasTrailingWhitespaces() {
    // Setup
    let actual = "Rugmangathan   "

    // Assert
    let expected = "Rugmangathan"
    XCTAssertEqual(BudapestModel().removeWhitespaces(actual), expected)
  }

  func testShouldRemoveExtraWhitespacesInBetweenName_whenNameHasMoreThanOneWhiteSpacesInBetween() {
    // Setup
    let actual = "Rugmangathan   M K"

    // Assert
    let expected = "Rugmangathan M K"
    XCTAssertEqual(BudapestModel().removeWhitespaces(actual), expected)
  }
}
