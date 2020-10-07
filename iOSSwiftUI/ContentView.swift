//
//  ContentView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 29/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State var showSplash = true
  
  init() {
    //Use this if NavigationBarTitle is with Large Font
    if let theme = UIColor(named: "theme") {
      UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: theme]
      UINavigationBar.appearance().backgroundColor = theme
      UINavigationBar.appearance().tintColor = .red
      
      //Use this if NavigationBarTitle is with displayMode = .inline
      UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: theme]
    }
  }
  
  var body: some View {
    ZStack {
      NavigationView {
        List {
          ForEach (items) { item in
            if item.name == "Movies" {
              MovieCellView(item: item)
            } else if item.name == "Employee Database" {
              EmployeesCellView(item: item)
            } else if item.name == "Weather" {
              WeatherCellView(item: item)
            } else if item.name == "CustomDesigns" {
              CustomDesignsCellView(item: item)
            } else if item.name == "Animations" {
              AnimationsCellView(item: item)
            } else if item.name == "Charts" {
              ChartsCellView(item: item)
            } else if item.name == "Viper" {
              ViperHomeCellView(item: item)
            }
          }
        }
        .navigationBarTitle(Text("iOS SwiftUI App"), displayMode: .inline)
      }
      SplashScreen()
        .opacity(showSplash ? 1 : 0)
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            SplashScreen.shouldAnimate = false
            withAnimation() {
              self.showSplash = false
            }
          }
      }
    }
  }
}

struct MovieCellView: View {
  var item: Item
  let context = CoreDataManager.shared.persistentContainer.viewContext
  
  var body: some View {
    NavigationLink (destination: MovieList().environment(\.managedObjectContext, context)) {
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

struct CustomDesignsCellView: View {
  var item: Item
  var body: some View {
    NavigationLink (destination: CustomDesignsView()) {
      Text(item.name)
    }
  }
}

struct AnimationsCellView: View {
  var item: Item
  var body: some View {
    NavigationLink (destination: AnimationsView()) {
      Text(item.name)
    }
  }
}

struct ChartsCellView: View {
  var item: Item
  var body: some View {
    NavigationLink (destination: ChartsView()) {
      Text(item.name)
    }
  }
}

struct ViperHomeCellView: View {
  var item: Item
  var body: some View {
    NavigationLink (destination: ViperHomeView().environmentObject(DataModel.sample)) {
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

let items = [Item(name: "Movies"), Item(name: "Employee Database"),
             Item(name: "Weather"), Item(name: "CustomDesigns"),
             Item(name: "Animations"), Item(name: "Charts"),
             Item(name: "Viper")]
