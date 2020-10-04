//
//  MovieList.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 29/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct MovieList: View {
  @ObservedObject var movieStore = MovieStore()
  @State private var isPresented = false
  @Environment(\.managedObjectContext) var managedObjectContext
  
  @FetchRequest(entity: Movie.entity(), sortDescriptors: [
      NSSortDescriptor(keyPath: \Movie.title, ascending: true)
    ]
  )
//  , predicate: NSPredicate(format: "genre contains 'Action'"))
  var movies: FetchedResults<Movie>
  
  @FetchRequest(entity: UserInfo.entity(), sortDescriptors: [
      NSSortDescriptor(keyPath: \UserInfo.name, ascending: true)
    ]
  )
  var user: FetchedResults<UserInfo>

  var body: some View {
    List {
      ForEach(movies, id: \.title) {
        MovieRow(movie: $0)
      }
      .onDelete(perform: deleteMovie)
    }
    .sheet(isPresented: $isPresented) {
      AddMovie(movieStore: self.movieStore, showModal: self.$isPresented)
    }
    .navigationBarTitle(Text("Movie List"), displayMode: .inline)
    .navigationBarItems(
      trailing:
      HStack {
        NavigationLink(destination: UserView()) {
          HStack {
            Text(user.first?.name ?? "")
            Image(systemName: "person.fill")
          }
        }
        Spacer()
        Button(action: { self.isPresented.toggle() }) {
          Image(systemName: "plus")
        }
      }
    )
  }
  
  func deleteMovie(at offsets: IndexSet) {
    offsets.forEach { index in
      movieStore.deleteMovie(movie: movies[index])
    }
  }
}

struct MovieList_Previews: PreviewProvider {
  static var previews: some View {
    MovieList(movieStore: MovieStore())
  }
}
