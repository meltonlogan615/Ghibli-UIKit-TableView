//
//  EndPoints.swift
//  ghibli-tableview
//
//  Created by Logan Melton on 21/10/19.
//

import Foundation

struct EndPoints {
  private var path: String

// TODO: Remove this property and all instances of it from methods below
  private var queryItems: [URLQueryItem] = []
}

extension EndPoints {
  var endpointURL: URL {
    
//    Provided in the original source code, but is not required for this purpose... I don't think
//    let defaultQueryItems = [URLQueryItem(name: "api_key", value: "4258adb04e249b52c4d9dba2586f9c8a"),URLQueryItem(name: "language", value: "en-US")]
   
    var components = URLComponents()
    components.scheme = "https"
    components.host = "ghibliapi.herokuapp.com/"
    components.path = "/\(path)"

//    Provided in the original source code, but is not required for this purpose... I don't think
//    components.queryItems = queryItems //+ defaultQueryItems
    
    guard let url = components.url else {
      preconditionFailure("Invalid URL components: \(components)")
    }
    return url
  }
}

extension EndPoints {

  static func getAllFilms() -> Self {
    return EndPoints(path: "films")
  }
  
  static func getMovieDetails(movieId id: String) -> Self {
    EndPoints(path: "films/\(id)")
  }
  
//  Provided in the original source code:
//  static func popularMovies(atPage page : String) -> Self {
//    let pageQueryItem = URLQueryItem(name: "page", value: page)
//    return Endpoint(path: "3/movie/popular", queryItems: [pageQueryItem])
//  }
//
//  static func movie(withId id : String) -> Self {
//    Endpoint(path: "3/movie/\(id)")
//  }
}
