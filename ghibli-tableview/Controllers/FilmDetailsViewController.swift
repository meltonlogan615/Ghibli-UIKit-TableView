  //
  //  FilmDetailsScrollView.swift
  //  ghibli-tableview
  //
  //  Created by Logan Melton on 21/10/10.
  //

import UIKit

class FilmDetailsViewController: UIViewController {
  
  var filmDetails: Films?
  var posters = [String]()
  var imageIndex = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let film = filmDetails else { return }
    let trailingEdge = (view.bounds.width - 20)
    let leadingEdge = (view.frame.minX + 20)
    
    navigationController?.navigationBar.prefersLargeTitles = false
    
    navigationController?.navigationBar.tintColor = .red
    title = film.original_title
    
    let backgroundImage = UIImageView()
    backgroundImage.frame = CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY)
    backgroundImage.layer.zPosition = -8
    backgroundImage.image = UIImage(named: "\(film.id)")
    backgroundImage.contentMode = .scaleAspectFill
    view.addSubview(backgroundImage)
    
      //      let segmentController = UISegmentedControl()
      //      segmentController.frame = CGRect(x: leadingEdge, y: 100, width: trailingEdge - 20, height: 20)
      //      segmentController.insertSegment(withTitle: "Film", at: 1, animated: true)
      //      segmentController.insertSegment(withTitle: "Characters", at: 2, animated: true)
      //      view.addSubview(segmentController)
    
    let backgroundFilter = UIBlurEffect(style: .dark)
    let blurredBackground = UIVisualEffectView(effect: backgroundFilter)
    blurredBackground.frame = CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY)
    view.addSubview(blurredBackground)
    
    
    let posterContainer = UIImageView()
    posterContainer.frame = CGRect(x: leadingEdge, y: 120, width: trailingEdge, height: view.bounds.height / 3)
    posterContainer.image = UIImage(named: "\(film.id)")
    posterContainer.contentMode = .scaleAspectFit
    posterContainer.sizeThatFits(CGSize(width: view.frame.width - 80, height: 120))
      //    print(posters[imageIndex])a
    view.addSubview(posterContainer)
    
    let directorLabel = UILabel()
    directorLabel.frame = CGRect(x: leadingEdge, y: posterContainer.frame.maxY + 10, width: trailingEdge, height: 20)
    directorLabel.text = "Directed By: \(film.director)"
    view.addSubview(directorLabel)
    
    let producerLabel = UILabel()
    producerLabel.frame = CGRect(x: leadingEdge, y: directorLabel.frame.maxY + 5, width: trailingEdge, height: 20)
    producerLabel.text = "Produced By: \(film.producer)"
    view.addSubview(producerLabel)
    
    let yearLabel = UILabel()
    yearLabel.frame  = CGRect(x: leadingEdge, y: producerLabel.frame.maxY + 5, width: trailingEdge, height: 20)
    yearLabel.text = "Year Released: \(film.release_date)"
    yearLabel.numberOfLines = 0
    view.addSubview(yearLabel)
    
    let descriptionLabel = UILabel()
    descriptionLabel.frame = CGRect(x: leadingEdge, y: yearLabel.frame.maxY + 5, width: trailingEdge, height: 20)
    descriptionLabel.text = "Description:"
    descriptionLabel.font = UIFont(name: "Helvetica-Bold", size: 17)
    view.addSubview(descriptionLabel)
    
    let descriptionText = UILabel()
    descriptionText.frame = CGRect(x: leadingEdge, y: descriptionLabel.frame.maxY + 5, width: trailingEdge, height: 180)
    descriptionText.text = "\(film.description)"
    descriptionText.textAlignment = .natural
    descriptionText.font = UIFont(name: "Helvetica", size: 17)
    descriptionText.numberOfLines = 0
    descriptionText.lineBreakMode = .byWordWrapping
    descriptionText.sizeToFit()
    view.addSubview(descriptionText)
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
