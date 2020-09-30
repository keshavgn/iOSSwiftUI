//
//  ContentView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 29/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      List {
        ForEach (items) { item in
          HomeCellView(item: item)
        }
      }
      .navigationBarTitle(Text("iOS SwiftUI App"))
    }
  }
}

struct HomeCellView: View {
  var item: Item
  var body: some View {
    NavigationLink (destination: MovieList().environmentObject(UserStore())) {
      Text(item.name)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct Item: Identifiable {
  var id = UUID()
  var name: String
}

let items = [Item(name: "Movies")]
