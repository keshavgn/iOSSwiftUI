//
//  AddMovie.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 29/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct AddMovie: View {
  static let DefaultMovieTitle = "An untitled masterpiece"
  static let DefaultMovieGenre = "Genre-buster"

  let movieStore: MovieStore
  @Binding var showModal: Bool
  @State private var title = ""
  @State private var genre = ""
  @State private var releaseDate = Date()

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Title")) {
          TextField("Title", text: $title)
        }
        Section(header: Text("Genre")) {
          TextField("Genre", text: $genre)
        }
        Section {
          DatePicker(
            selection: $releaseDate,
            displayedComponents: .date) { Text("Release Date").foregroundColor(Color(.gray)) }
        }
        Section {
          Button(action: addMoveAction) {
            Text("Add Movie")
          }
        }
      }
      .navigationBarTitle(Text("Add Movie"), displayMode: .inline)
    }
  }

  private func addMoveAction() {
    movieStore.addMovie(title: title, genre: genre, releaseDate: releaseDate)

    showModal.toggle()
  }
}

struct AddMovie_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
