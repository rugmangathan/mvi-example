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

  func testShouldEmitInitialState_whenNameIsEmpty() {
    // Setup
    let testObserver = TestScheduler(initialClock: 0).createObserver(BudapestState.self)
    let nameChanges = PublishRelay<String?>()
    let intentions = BudapestIntentions(textFieldChanges: nameChanges.asObservable())
    BudapestModel()
      .bind(intentions: intentions)
      .subscribe(testObserver)
      .disposed(by: disposeBag)

    // Fake events
    nameChanges.accept("")

    // Assert
    let expectedEvent = [
      next(0, BudapestState("")),
    ]
    XCTAssertEqual(testObserver.events, expectedEvent)
  }

  func testShouldEmitNameChanges_whenUserTypes() {
    // Setup
    let testObserver = TestScheduler(initialClock: 0).createObserver(BudapestState.self)
    let nameChanges = PublishRelay<String?>()
    let intentions = BudapestIntentions(textFieldChanges: nameChanges.asObservable())

    BudapestModel()
      .bind(intentions: intentions)
      .subscribe(testObserver)
      .disposed(by: disposeBag)

    // Fake Events
    nameChanges.accept("RMK")

    // Assert
    let expectedEvents = [
      next(0, BudapestState("RMK"))
    ]
    XCTAssertEqual(testObserver.events, expectedEvents)
  }

  func testShouldEmitEmpty_whenUserEntersWhitespacesOnlyText() {
    let actual = "  "

    // Assert
    let expected = ""
    XCTAssertEqual(BudapestModel().removeWhitespaces(actual), expected)
  }

  func testShouldRemoveLeadingSpaces_whenNameChangesTextHasLeadingWhitespaces() {
    // Setup
    let actual = "   Rugmangathan"

    // Assert
    let expected = "Rugmangathan"
    XCTAssertEqual(BudapestModel().removeWhitespaces(actual), expected)
  }
}
