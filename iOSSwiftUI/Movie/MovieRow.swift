//
//  MovieRow.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 29/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct MovieRow: View {
  let movie: Movie

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(movie.title)
          .font(.title)
        Text(movie.genre)
          .font(.caption)
      }
      Spacer()
      VStack(alignment: .trailing) {
        Spacer()
        RatingView(rating: movie.rating)
      }
    }
  }
}
