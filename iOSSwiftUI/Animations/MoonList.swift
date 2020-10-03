//
//  MoonList.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 03/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct MoonList: View {
  let planet: Planet
  @State private var showModal = false
  @State private var selectedMoon: Moon?

  var body: some View {
    VStack {
      SolarSystem(planet: planet)
        .frame(height: 160)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          ForEach(planet.moons) { moon in
            Button(action: {
              self.showModal = true
              self.selectedMoon = moon
            }) {
              HStack {
                Image(systemName: "moon")
                Text(moon.name)
              }.sheet(isPresented: self.$showModal) {
                PlanetInfo(planet: self.planet, startingMoon: self.selectedMoon!)
              }
            }
          }
        }
      }
    }
  }
}

#if DEBUG
struct MoonList_Previews: PreviewProvider {
  static var previews: some View {
    MoonList(planet: planets[5])
      .frame(width: 320)
  }
}
#endif
