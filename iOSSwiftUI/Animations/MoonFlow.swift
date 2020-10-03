//
//  MoonFlow.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 03/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct MoonFlow: View {
  @State var selectedMoon: Moon
  var moons: [Moon]

  var body: some View {
    GeometryReader { geometry in
      ScrollView(.horizontal) {
        HStack(spacing: 20) {
          ForEach(self.moons) { moon in
            GeometryReader { moonGeometry in
              VStack{
                Image(moon.image)
                  .resizable()
                  .frame(width:120, height: 120)
                Text(moon.name)
              }
              .rotation3DEffect(
                .degrees(Double(moonGeometry
                  .frame(in: .global).midX - geometry.size.width / 2) / 3),
                axis: (x: 0, y: 1, z: 0)
              )
            }.frame(width:120)
          }
        }
        .frame(minWidth: geometry.size.width)
      }
      .frame(width: geometry.size.width)
    }
  }
}

#if DEBUG
struct MoonFlow_Previews: PreviewProvider {
  static var previews: some View {
    MoonFlow(selectedMoon: planets[5].moons[0], moons: planets[5].moons)
  }
}
#endif
