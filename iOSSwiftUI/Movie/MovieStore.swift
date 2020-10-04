//
//  MovieStore.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 29/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation

class MovieStore: ObservableObject {
  func addMovie(title: String, genre: String, releaseDate: Date) {
    let newMovie = Movie(context: CoreDataManager.shared.context)
    newMovie.title = title
    newMovie.genre = genre
    newMovie.releaseDate = releaseDate
    CoreDataManager.shared.saveContext()
  }

  func deleteMovie(movie: Movie) {
    CoreDataManager.shared.context.delete(movie)
    CoreDataManager.shared.saveContext()
  }
}
