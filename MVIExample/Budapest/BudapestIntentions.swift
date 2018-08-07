//
//  Strings+Ex.swift
//  MVIExample
//
//  Created by Rugmangathan on 02/01/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift

class BudapestIntentions {
  let nameTextFieldChanges: Observable<String>
  
  init(_ nameTextFieldChanges: Observable<String>) {
    self.nameTextFieldChanges = nameTextFieldChanges
  }
  
  func enterName() -> Observable<String> {
    return nameTextFieldChanges
  }
}
