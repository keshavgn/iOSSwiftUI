//
//  Movie.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 29/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation

struct Movie: Codable {
  let title: String
  let genre: String
  let rating: Double
}

extension Movie {
  static var possibleGenres: [String] {
    [
      "Action",
      "Adventure",
      "Crime",
      "Comedy",
      "Drama",
      "Family",
      "Fantasy",
      "Horror",
      "Mystery",
      "Romance",
      "Sci-Fi",
      "Thriller",
      "Western"
    ]
  }
}
