//
//  BudapestViewTests.swift
//  OttraiThisaiOttamTests
//
//  Created by Rugmangathan on 11/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import XCTest
import Cuckoo
@testable import OttraiThisaiOttam

class BudapestViewTests: XCTestCase {
  func testRenderGreetStranger() {
    // Setup
    let spyView = MockSpyableBudapestView()
      .spy(on: SpyableBudapestView())
    let renderer = BudapestViewRenderer(spyView)

    // Fake events
    renderer.render(BudapestState(""))

    // Assert
    verify(spyView, times(1)).greetStranger()
  }

  func testRenderGreetingState() {
    // Setup
    let spyView = MockSpyableBudapestView()
      .spy(on: SpyableBudapestView())
    let renderer = BudapestViewRenderer(spyView)

    // Fake events
    renderer.render(BudapestState("Rugmangathan"))

    // Assert
    verify(spyView, times(1)).greet("Rugmangathan")
  }
}
