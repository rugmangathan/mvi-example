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
    let model = BudapestModel()
    model
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
}
