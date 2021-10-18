//
//  People.swift
//  ghibli
//
//  Created by Logan Melton on 21/6/17.
//

import Foundation

struct People: Codable, Identifiable {
  var id:           Int //  The unique ID of the character resource.
  var name:         String //  The name of the character.
  var description:  String //  A short bio or description of the character.
  var modified:     Date //  The date the resource was most recently modified.
  var resourceURI:  String //  The canonical URL identifier for this resource.
  var urls:         [URL]  //A set of public web site URLs for the resource.
  var thumbnail:    Data  //The representative image for this character.
//  var comics  ResourceList  A resource list containing comics which feature this character.
//  var stories  ResourceList  A resource list of stories in which this character appears.
//  var events  ResourceList  A resource list of events in which this character appears.
//  var series  ResourceList  A resource list of series in which this character appears.
}
