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

  static let releaseFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }()

  var body: some View {
    VStack(alignment: .leading) {
      movie.title.map(Text.init)
        .font(.title)
      HStack {
        movie.genre.map(Text.init)
          .font(.caption)
        Spacer()
        movie.releaseDate.map { Text(Self.releaseFormatter.string(from: $0)) }
          .font(.caption)
      }
    }
  }
}
