//
//  Films.swift
//  ghibli
//
//  Created by Logan Melton on 21/6/17.
//

import Foundation

struct Wrapper: Decodable {
  var code: Int?
  var status: String?
  var data: Container?
  var etag: String?
  var copyrite: String?
  var attributionText: String?
  var attributionHTML: String?
}
