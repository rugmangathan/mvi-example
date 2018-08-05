//
//  BudapestViewTests.swift
//  OttraiThisaiOttamTests
//
//  Created by Rugmangathan on 11/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import XCTest
import Cuckoo
@testable import MVIExample

class BudapestViewTests: XCTestCase {
  var view: MockSpyableBudapestView!
  var renderer: BudapestViewRenderer!

  override func setUp() {
    view = MockSpyableBudapestView().withEnabledSuperclassSpy()
    renderer = BudapestViewRenderer(view)
  }

  func testRenderGreetStranger() {
    // Fake events
    renderer.render(BudapestState(""))

    // Assert
    verify(view, times(1)).greetStranger()

    verify(view, never()).greet(any())
  }

  func testRenderGreetingState() {
    // Fake events
    renderer.render(BudapestState("Rugmangathan"))

    // Assert
    verify(view, times(1)).greet("Rugmangathan")

    verify(view, never()).greetStranger()
  }
}
