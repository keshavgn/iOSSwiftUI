//
//  SettingsView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 02/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

extension AnyTransition {
  static var customTransition: AnyTransition {
    let transition = AnyTransition.move(edge: .top)
      .combined(with: .scale(scale: 0.2, anchor: .topTrailing))
      .combined(with: .opacity)
    return transition
  }
}

struct AnimationsView: View {
  @State var showMoon: String? = nil
  let moonAnimation = Animation.default
  
  func toggleMoons(_ name: String) -> Bool {
    return name == showMoon
  }

  var body: some View {
    List(planets) { planet in
      self.makePlanetRow(planet: planet)
    }
  }

  func makePlanetRow(planet: Planet) -> some View {
    VStack {
      HStack {
        Image(planet.name)
          .resizable()
          .aspectRatio(1, contentMode: .fit)
          .frame(height: 60)
        Text(planet.name)
        Spacer()
        if planet.hasMoons {
          Button(action: {
            withAnimation(.easeInOut) {
              self.showMoon = self.toggleMoons(planet.name) ? nil : planet.name
            }
          }) {
            Image(systemName: "moon.circle.fill")
              .rotationEffect(.degrees(self.toggleMoons(planet.name) ? -50 : 0))
              .animation(nil)
              .scaleEffect(self.toggleMoons(planet.name) ? 2 : 1)
              .animation(moonAnimation)
          }
        }
      }
      if self.toggleMoons(planet.name) {
        MoonList(planet: planet)
        .transition(.customTransition)
      }
    }
    .navigationBarTitle("Animations", displayMode: .inline)
  }
}

#if DEBUG
struct AnimationsView_Previews: PreviewProvider {
  static var previews: some View {
    AnimationsView()
  }
}
#endif
