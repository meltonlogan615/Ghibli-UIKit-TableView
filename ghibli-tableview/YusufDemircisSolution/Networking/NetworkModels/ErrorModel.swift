//
//  Error.swift
//  ghibli-tableview
//
//  Created by Logan Melton on 21/10/18.
//

import Foundation

class ErrorModel: Error {
  var messageKey: String
  var message: String {
    return messageKey.localized()
  }
  
  init(_ messageKey: String) {
    self.messageKey = messageKey
  }
}

extension ErrorModel {
  class func generalError() -> ErrorModel {
    return ErrorModel(ErrorKey.general.rawValue)
  }
}
