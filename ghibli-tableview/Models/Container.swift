//
//  Container.swift
//  ghibli-tableview
//
//  Created by Logan Melton on 21/6/21.
//

import Foundation

struct Container: Decodable {
  var offset:  Int?  // The requested offset (skipped results) of the call
  var limit:   Int?  // The requested result limit
  var total:   Int?  // The total number of results available
  var count:   Int?  // The total number of results returned by this call
  var results: [Endpoint]? // The list of entities returned by the call
}
