//
//  CounterViewTests.swift
//  OttraiThisaiOttamTests
//
//  Created by Rugmangathan on 13/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import XCTest
import Cuckoo
@testable import OttraiThisaiOttam

class CounterViewTests: XCTestCase {
  func testRenderCounterState() {
    // Setup
    let spyView = MockSpyableCounterView()
      .withEnabledSuperclassSpy()
    let renderer = CounterViewRenderer(spyView)
    let count: Int64 = 1, clicks: Int64 = 1

    // Act
    renderer.render(CounterState(count: count, clicks: clicks))

    //Assert
    verify(spyView, times(1)).showCounterValues(count, clicks)
  }
}
