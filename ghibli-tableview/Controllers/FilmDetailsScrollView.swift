//
//  FilmDetailsScrollView.swift
//  ghibli-tableview
//
//  Created by Logan Melton on 21/10/10.
//

import UIKit

class FilmDetailsScrollView: UIViewController {
  
  var filmDetails: Films?
  var posters = [String]()
  
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
      
      
      let backgroundFilter = UIBlurEffect(style: .regular)
      let blurredBackground = UIVisualEffectView(effect: backgroundFilter)
      blurredBackground.frame = CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY)
      view.addSubview(blurredBackground)
      
//      let segmentController = UISegmentedControl()
//      segmentController.frame = CGRect(x: leadingEdge, y: 100, width: trailingEdge - 20, height: 30)
//      segmentController.insertSegment(withTitle: "Film", at: 1, animated: true)
//      segmentController.insertSegment(withTitle: "Characters", at: 2, animated: true)
//      view.addSubview(segmentController)
      
//      segmentController.frame.maxY + 20  <-- use for posterContainer.frame.y when used in conjunction with segementController
      
      let posterContainer = UIImageView()
      posterContainer.frame = CGRect(x: leadingEdge, y: 100, width: trailingEdge, height: view.bounds.height / 3)
      posterContainer.image = UIImage(named: "\(film.id)")
      posterContainer.contentMode = .scaleAspectFit
      posterContainer.sizeThatFits(CGSize(width: view.frame.width - 80, height: 120))
      view.addSubview(posterContainer)
      
      let directorLabel = UILabel()
      directorLabel.frame = CGRect(x: leadingEdge, y: posterContainer.frame.maxY + 10, width: 125, height: 20)
      directorLabel.text = "Directed By: "
      directorLabel.font = UIFont(name: "Helvetica-Bold", size: 17)
      view.addSubview(directorLabel)
      
      let directorInfo = UILabel()
      directorInfo.frame = CGRect(x: directorLabel.frame.maxX + 10, y: posterContainer.frame.maxY + 10, width: 150, height: 20)
      directorInfo.text = "\(film.director)"
      view.addSubview(directorInfo)
      
      let producerLabel = UILabel()
      producerLabel.frame = CGRect(x: leadingEdge, y: directorLabel.frame.maxY + 5, width: 125, height: 20)
      producerLabel.text = "Produced By: "
      producerLabel.font = UIFont(name: "Helvetica-Bold", size: 17)
      view.addSubview(producerLabel)
      
      let producerInfo = UILabel()
      producerInfo.frame = CGRect(x: producerLabel.frame.maxX + 10, y: directorLabel.frame.maxY + 5, width: 150, height: 20)
      producerInfo.text = "\(film.producer)"
      view.addSubview(producerInfo)
      
      let yearLabel = UILabel()
      yearLabel.frame  = CGRect(x: leadingEdge, y: producerLabel.frame.maxY + 5, width: 125, height: 20)
      yearLabel.text = "Year Released: "
      yearLabel.font = UIFont(name: "Helvetica-Bold", size: 17)
      view.addSubview(yearLabel)
      
      let yearInfo = UILabel()
      yearInfo.frame  = CGRect(x: yearLabel.frame.maxX + 10, y: producerLabel.frame.maxY + 5, width: 150, height: 20)
      yearInfo.text = "\(film.release_date)"
      view.addSubview(yearInfo)
      
      let rottenTomatoesLabel = UILabel()
      rottenTomatoesLabel.frame = CGRect(x: leadingEdge, y: yearLabel.frame.maxY + 5, width: 125, height: 20)
      rottenTomatoesLabel.text = "Rating: "
      rottenTomatoesLabel.font = UIFont(name: "Helvetica-Bold", size: 17)
      view.addSubview(rottenTomatoesLabel)
      
      let rottenTomatoesInfo = UILabel()
      rottenTomatoesInfo.frame = CGRect(x: rottenTomatoesLabel.frame.maxX + 10, y: yearLabel.frame.maxY + 5, width: 150, height: 20)
      rottenTomatoesInfo.text = "\(film.rt_score)%"
      view.addSubview(rottenTomatoesInfo)
      
      let descriptionLabel = UILabel()
      descriptionLabel.frame = CGRect(x: leadingEdge, y: rottenTomatoesLabel.frame.maxY + 5, width: trailingEdge, height: 20)
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
}
