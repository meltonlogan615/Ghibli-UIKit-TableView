//
//  RequestModel.swift
//  ghibli-tableview
//
//  Created by Logan Melton on 21/10/18.
//

import Foundation
import UIKit

enum RequestHTTPMethod: String {
  case get = "GET"
  case post = "POST"
}

class RequestModel: NSObject {
  
    // MARK: - Properties
  var path: String {
    return ""
  }

  var method: RequestHTTPMethod {
    return RequestHTTPMethod.get
  }
  var body: [String: Any?] {
    return [:]
  }
  
//    // (request, response)
//  var isLoggingEnabled: (Bool, Bool) {
//    return (true, true)
//  }
}

  // MARK: - Public Functions
extension RequestModel {
  
  func urlRequest() -> URLRequest {
    let endpoint: String = NetworkManager.shared.baseURL.appending(path)
    
    var request: URLRequest = URLRequest(url: URL(string: endpoint)!)
    
    request.httpMethod = method.rawValue
    
    return request
  }
}
