//
//  CounterViewRenderer.swift
//  MVIExample
//
//  Created by Rugmangathan on 13/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

class CounterViewRenderer {
  let view: CounterView
  
  init(_ view: CounterView) {
    self.view = view
  }
  
  func render(_ state: CounterState) {
    view.showCounterValues(state.count, state.clicks)
  }
 }
