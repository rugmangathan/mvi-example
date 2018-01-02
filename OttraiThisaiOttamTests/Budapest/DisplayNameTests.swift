//
//  DisplayNameTests.swift
//  OttraiThisaiOttamTests
//
//  Created by Rugmangathan on 02/01/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import XCTest
@testable import OttraiThisaiOttam

class DisplayNameTests: XCTestCase {
  func testShouldRemoveWhitespaces_whenNameHasOnlyWhitespaces() {
    // Setup
    let actual = "  "

    // Assert
    let expected = ""
    XCTAssertEqual(BudapestModel().toDisplayName(actual), expected)
  }

  func testShouldRemoveLeadingSpaces_whenNameHasLeadingWhitespaces() {
    // Setup
    let actual = "   Rugmangathan"

    // Assert
    let expected = "Rugmangathan"
    XCTAssertEqual(BudapestModel().toDisplayName(actual), expected)
  }
}
