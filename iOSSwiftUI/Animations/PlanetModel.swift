//
//  PlanetModel.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 03/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

let planets = [
  Planet(name: "Mercury",
         moons: [],
         radius: 2_439.7,
         weight: 3.3011e23,
         gravity: 0.38,
         drawColor: .gray),
  Planet(name: "Venus",
         moons: [],
         radius: 6_051.8,
         weight: 4.8675e24,
         gravity: 0.904,
         drawColor: .yellow),
  Planet(name: "Earth",
         moons: [Moon(name: "Luna")],
         radius: 6_371,
         weight: 5.97237e24,
         gravity: 1,
         drawColor: .blue),
  Planet(name: "Mars",
         moons: [Moon(name: "Phobos"),
                 Moon(name: "Deimos")],
         radius: 3_389.5,
         weight: 6.4171e23,
         gravity: 0.3794,
         drawColor: .red),
  Planet(name: "Jupiter",
         moons: [Moon(name: "Ganymede"),
                 Moon(name: "Callisto"),
                 Moon(name: "Europa"),
                 Moon(name: "Amalthea"),
                 Moon(name: "Himalia"),
                 Moon(name: "Thebe"),
                 Moon(name: "Elara")],
         radius: 69_911,
         weight: 1.8982e27,
         gravity: 2.528,
         drawColor: .orange),
  Planet(name: "Saturn",
         moons: [Moon(name: "Titan"),
                 Moon(name: "Rhea"),
                 Moon(name: "Iapetus"),
                 Moon(name: "Dione"),
                 Moon(name: "Tethys"),
                 Moon(name: "Enceladus"),
                 Moon(name: "Mimas"),
                 Moon(name: "Hyperion"),
                 Moon(name: "Phoebe"),
                 Moon(name: "Janus")],
         radius: 60_268,
         weight: 5.6834e26,
         gravity: 1.065,
         drawColor: .yellow),
  Planet(name: "Uranus",
         moons: [Moon(name: "Titania"),
                 Moon(name: "Oberon"),
                 Moon(name: "Umbriel"),
                 Moon(name: "Ariel"),
                 Moon(name: "Miranda")],
         radius: 25_362,
         weight: 8.6810e25,
         gravity: 0.886,
         drawColor: .blue),
  Planet(name: "Neptune",
         moons: [Moon(name: "Triton"),
                 Moon(name: "Proteus"),
                 Moon(name: "Nereid"),
                 Moon(name: "Larissa"),
                 Moon(name: "Galatea")],
         radius: 24_622,
         weight: 1.02413e26,
         gravity: 1.14,
         drawColor: .blue)
]

struct Planet {
  let name: String
  let moons: [Moon]
  let radius: Double
  let weight: Double
  let gravity: Double
  let drawColor: Color

  var hasMoons: Bool { !moons.isEmpty }
}

extension Planet: Identifiable {
  var id: String {
    return name
  }
}

struct Moon {
  let name: String
  var image: String {
    name.lowercased()
  }
}

extension Moon: Identifiable {
  var id: String {
    return name
  }
}

extension Moon: Equatable {}

