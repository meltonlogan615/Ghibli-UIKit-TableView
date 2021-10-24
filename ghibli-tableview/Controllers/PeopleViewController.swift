  //
  //  CharactersViewController.swift
  //  ghibli-tableview
  //
  //  Created by Logan Melton on 21/10/24.
  //

import UIKit

class PeopleViewController: UITableViewController {
  
  var dataProvider = DataProvider()
  var model = [People]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadCharacters()
  }
  
  
  private func loadCharacters() {
    dataProvider.getPeople{ [weak self] (peopleResult: Result<[People], Error>) in
      guard let self = self else { return }
      switch peopleResult {
        case .success(let model):
          self.model = model as [People]
          self.tableView.reloadData()
        case .failure(let error):
          print(error)
      }
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    model.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell", for: indexPath)
    cell.imageView!.frame = CGRect(x: cell.frame.minX, y: cell.frame.minY, width: 30, height: 60)
    cell.imageView!.image = UIImage(named: "\(model[indexPath.row].id)")
    cell.textLabel?.text = "\(model[indexPath.row].name)"
    return cell
  }
  
  
  
}
