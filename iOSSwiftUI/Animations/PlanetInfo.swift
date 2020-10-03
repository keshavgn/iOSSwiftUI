//
//  PlanetInfo.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 03/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct PlanetInfo: View {
  @Environment(\.presentationMode) var presentation
  let planet: Planet
  let startingMoon: Moon

  var numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.usesGroupingSeparator = true
    nf.maximumFractionDigits = 0
    return nf
  }()

  var bigNumberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .scientific
    nf.usesGroupingSeparator = true
    nf.maximumFractionDigits = 0
    return nf
  }()

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(planet.name)
          .font(.largeTitle)
        Spacer()
        Button("Done") {
          self.presentation.wrappedValue.dismiss()
        }
      }.padding()
      MoonFlow(selectedMoon: startingMoon, moons: planet.moons)
        .frame(height:200)
      Text("Radius: \(numberFormatter.string(for: planet.radius)!)km").padding()
      Text("Weight: \(bigNumberFormatter.string(for: planet.weight)!)kg").padding()
      Text("Gravity: \(planet.gravity)g").padding()
      Spacer()
    }
  }
}
