  //
  //  ServiceManager.swift
  //  ghibli-tableview
  //
  //  Created by Logan Melton on 21/10/18.
  //

import Foundation

class NetworkManager {
  static let shared: NetworkManager = NetworkManager()
  var baseURL: String = "https://ghibliapi.herokuapp.com/"
}

extension NetworkManager {
//  func sendRequest<T: Codable>(request: RequestModel, completion: @escaping(Swift.Result<T, ErrorModel>) -> Void) {
//    if request.isLoggingEnabled.0 {
//      LogManager.req(request)
//    }
//  }
  
  func sendRequest<T: Codable>(request: RequestModel, completion: @escaping(Swift.Result<T, ErrorModel>) -> Void) {
    
  }
}
