//
//  Film.swift
//  ghibli-tableview
//
//  Created by Logan Melton on 21/6/23.
//

import Foundation

struct Films: Codable, Identifiable, Equatable, Comparable {
  var id: String
  var title: String
  var original_title: String
  var original_title_romanised: String
  var description: String
  var director: String
  var producer: String
  var release_date: String
  var running_time: String
  var rt_score: String
}

extension Films {
  static func < (lhs: Films, rhs: Films) -> Bool {
    return lhs.title < rhs.title
  }
}

//extension Films {
//  static func < (lhs: Films, rhs: Films) -> Bool {
//    return lhs.release_date < rhs.release_date
//  }
//}


