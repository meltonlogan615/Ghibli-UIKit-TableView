  //
  //  JsonParser.swift
  //  ghibli-tableview
  //
  //  Created by Logan Melton on 21/10/19.
  //

import Foundation

struct JsonParser {
  
  private var data: Data
  private var decoder: JSONDecoder
  
    // by setting decoder to Type JSONDecoder with the default value of an initialized JSONDecoder, will reduce future duplication
  init(data: Data, decoder: JSONDecoder = JSONDecoder()) {
    self.data = data
    self.decoder = decoder
  }
  
  func decode<T: Decodable>() -> Result<[T], Error> {
    do {
      print("*** Am I going to work 😬? ***")
      let decodedObject = try decoder.decode([T].self, from: data)
      print("*** I WORKED!!! ***")
      return .success(decodedObject)
    } catch {
      print("*** Nah, I break ***")
      return .failure(error)
    }
    
  }
}

