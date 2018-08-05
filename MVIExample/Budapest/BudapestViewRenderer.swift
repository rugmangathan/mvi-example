//
//  BudapestViewRenderer.swift
//  OttraiThisaiOttam
//
//  Created by Rugmangathan on 11/12/17.
//  Copyright © 2017 Rugmangathan. All rights reserved.
//

class BudapestViewRenderer {
  let view: BudapestView

  init(_ view: BudapestView) {
    self.view = view
  }

  func render(_ state: BudapestState) {
    state.name.isEmpty
      ? view.greetStranger()
      : view.greet(state.name)
  }
}
