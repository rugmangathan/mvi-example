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
    view.greetStranger()
  }
}
