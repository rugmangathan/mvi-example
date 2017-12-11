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
  var spyView: MockSpyableBudapestView!
  var renderer: BudapestViewRenderer!

  override func setUp() {
    spyView = MockSpyableBudapestView()
      .spy(on: SpyableBudapestView())
    renderer = BudapestViewRenderer(spyView)
  }

  func testRenderGreetStranger() {
    // Fake events
    renderer.render(BudapestState(""))

    // Assert
    verify(spyView, times(1)).greetStranger()

    verify(spyView, never()).greet(any())
  }

  func testRenderGreetingState() {
    // Fake events
    renderer.render(BudapestState("Rugmangathan"))

    // Assert
    verify(spyView, times(1)).greet("Rugmangathan")

    verify(spyView, never()).greetStranger()
  }
}
