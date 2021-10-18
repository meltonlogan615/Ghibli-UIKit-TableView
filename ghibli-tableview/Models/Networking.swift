  //
  //  Networking.swift
  //  ghibli-tableview
  //
  //  Created by Logan Melton on 21/6/25.
  //

import Foundation


func getData<T: Decodable>(view: FilmsViewController, dataType: T.Type) {
  var model = [Endpoint]()
  let url = "https://ghibliapi.herokuapp.com/films"
  let urlString = URL(string: url)!
  
  let task = URLSession.shared.dataTask(with: urlString) { data, response, error in
    if error != nil {
      print(error!)
    }
    if let data = data {
      let decodedData = try! JSONDecoder().decode([T].self, from: data)
      model = decodedData as! [Endpoint]
    }
    if data != nil {
      print(String(data: data!, encoding: .utf8) ?? "")
      DispatchQueue.main.async {
        view.tableView.reloadData()
      }
    }
  }
  task.resume()
}

