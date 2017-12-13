//
//  SpyableCounterView.swift
//  OttraiThisaiOttamTests
//
//  Created by Rugmangathan on 13/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

import Foundation
@testable import OttraiThisaiOttam

class SpyableCounterView: CounterView {
  func showCounterValues(_ count: Int64, _ clicks: Int64) {}
}
