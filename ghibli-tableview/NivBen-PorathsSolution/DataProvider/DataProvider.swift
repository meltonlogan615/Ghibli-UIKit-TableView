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
  
  func getMovies<T: Decodable>(completion: @escaping (Result<[T], Error>) -> Void) {
    let moviesEndpoint = EndPoints.getAllFilms()
    networkDataFlow.getData(for: moviesEndpoint.endpointURL) {(result: Result<[T], Error>) in
      completion(result)
    }
  }
  
  func getMoviePage<T: Decodable>(for movieId: String, completion: @escaping (Result<[T], Error>) -> Void) {
    let moviePageEndpoint = EndPoints.getMovieDetails(movieId: movieId)
    networkDataFlow.getData(for: moviePageEndpoint.endpointURL) { (result: Result<[T], Error>) in
      completion(result)
    }
  }
  
}
