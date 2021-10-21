//
//  DataProvider.swift
//  ghibli-tableview
//
//  Created by Logan Melton on 21/10/19.
//

import Foundation
import UIKit


class DataProvider {
  
  private let networkDataFlow = NetworkDataFlow()
  
// TODO: - Updated EndPoints to reflect the data that app will be pulling from API
  func getMoviesForPage<T: Decodable>(page: Int, completion: @escaping (Result<T, Error>) -> Void) {
    let moviesEndpoint = EndPoints.popularMovies(atPage: String(page))
    networkDataFlow.getData(for: moviesEndpoint.endpointURL) {(result: Result<T, Error>) in
      completion(result)
    }
  }
  
// TODO: - Updated EndPoints to reflect the data that app will be pulling from API
  func getMoviePage<T: Decodable>(for movieId: String, completion: @escaping (Result<T, Error>) -> Void) {
    let moviePageEndpoint = EndPoints.movie(movieId: movieId)
    networkDataFlow.getData(for: moviePageEndpoint.endpointURL) { (result: Result<T, Error>) in
      completion(result)
    }
  }
  
}
