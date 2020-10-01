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
          if item.name == "Movies" {
            MovieCellView(item: item)
          } else if item.name == "Employee Database" {
            EmployeesCellView(item: item)
          } else if item.name == "Weather" {
            WeatherCellView(item: item)
          }
        }
      }
      .navigationBarTitle(Text("iOS SwiftUI App"))
    }
  }
}

struct MovieCellView: View {
  var item: Item
  var body: some View {
    NavigationLink (destination: MovieList().environmentObject(UserStore())) {
      Text(item.name)
    }
  }
}

struct EmployeesCellView: View {
  var item: Item
  var body: some View {
    NavigationLink (destination: EmployeesView(store: Store(employees: employees))) {
      Text(item.name)
    }
  }
}

struct WeatherCellView: View {
  var item: Item
  var body: some View {
    NavigationLink (destination: WeeklyWeatherView(viewModel: WeeklyWeatherViewModel(weatherFetcher: WeatherFetcher()))) {
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

let items = [Item(name: "Movies"), Item(name: "Employee Database"), Item(name: "Weather")]
