//
//  MovieList.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 29/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

// swiftlint:disable multiple_closures_with_trailing_closure
struct MovieList: View {
  @EnvironmentObject var userStore: UserStore
  @ObservedObject var movieStore = MovieStore()
  @State private var isPresented = false
  
  var body: some View {
    List {
      ForEach(movieStore.movies, id: \.title) {
        MovieRow(movie: $0)
      }
      .onDelete(perform: movieStore.deleteMovie)
    }
    .sheet(isPresented: $isPresented) {
      AddMovie(movieStore: self.movieStore, showModal: self.$isPresented).environmentObject(self.userStore)
    }
    .navigationBarTitle(Text("Movies"), displayMode: .inline)
    .navigationBarItems(
      trailing:
      HStack {
        NavigationLink(destination: UserView().environmentObject(self.userStore)) {
          HStack {
            userStore.currentUserInfo.map { Text($0.userName) }
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
}

struct MovieList_Previews: PreviewProvider {
  static var previews: some View {
    MovieList(movieStore: MovieStore())
  }
}
