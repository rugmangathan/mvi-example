//
//  Strings+Ex.swift
//  MVIExample
//
//  Created by Rugmangathan on 02/01/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

extension String {
  func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
    return NSLocalizedString(self,
                             tableName: tableName,
                             bundle: bundle,
                             value: "**\(self)**",
                             comment: "")
  }
}
