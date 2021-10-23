//
//  People.swift
//  ghibli
//
//  Created by Logan Melton on 21/6/17.
//

import Foundation

struct People: Codable, Identifiable {
  var id: String
  var name: String
  var gender: String
  var age: String
  var eye_color: String
  var hair_color: String
  var films: [String]
  var species: String
  var url: String
}
