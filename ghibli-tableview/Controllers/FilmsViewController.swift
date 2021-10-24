  //
  //  ViewController.swift
  //  ghibli-tableview
  //
  //  Created by Logan Melton on 21/6/21.
  //

import UIKit

class FilmsViewController: UITableViewController {
  
  var dataProvider = DataProvider()
  var model = [Films]()
  

  
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    // MARK: - NavigationController
    navigationController?.navigationBar.prefersLargeTitles = true
      //    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Year", style: .plain, target: self, action: #selector(changeSortingMethod))
    navigationController?.navigationBar.isTranslucent = true
    navigationController?.navigationBar.tintColor = .red
    title = "Ghibli Films"
    
    loadMovies()
  }
    
// MARK: - Load Data
    private func loadMovies() {
      dataProvider.getMovies() { [weak self] (moviesResult: Result<[Films], Error>) in
        guard let self = self else { return }
        switch moviesResult {
          case .success(let model):
            self.model = model as [Films]
            self.tableView.reloadData()
          case .failure(let error):
            print(error)
        }
      }
    }
  
  
  
// TODO: - Update TableViews to reflect new data structures
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
    
    cell.imageView!.frame = CGRect(x: cell.frame.minX, y: cell.frame.minY, width: 30, height: 60)
    cell.imageView!.image = UIImage(named: "\(model[indexPath.row].id)")
    cell.textLabel?.text = model[indexPath.row].title
    cell.textLabel?.font = .systemFont(ofSize: 16)
    cell.detailTextLabel?.text = "Released: \(model[indexPath.row].release_date)"
    cell.detailTextLabel?.font = .systemFont(ofSize: 12)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  // MARK: Actions on Cells
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let filmDetailVC = FilmDetailsScrollView()
    filmDetailVC.filmDetails = model[indexPath.row]
    navigationController?.pushViewController(filmDetailVC, animated: true)
  }
  
// TODO: Add enum of properties that will allow for sorting based on the selected properties.
//  @objc func changeSortingMethod() {
//    model.sorted() { $0.release_date > $1.release_date }
//    self.tableView.reloadData()
//  }
  
}

