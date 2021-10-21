//
//  String+Extension.swift
//  ghibli-tableview
//
//  Created by Logan Melton on 21/10/18.
//

import Foundation

extension String {
  
  func localized() -> String {
    return NSLocalizedString(self, comment: self)
  }
}
