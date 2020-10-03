//
//  SolarSystem.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 03/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct SolarSystem: View {
  var moons: [Moon] { planet.moons }
  let planet: Planet
  @State private var animationFlag = false
  
  var body: some View {
    GeometryReader { geometry in
      self.makeSystem(geometry)
    }
  }

  func moonPath(planetSize: CGFloat, radiusIncrement: CGFloat, index: CGFloat) -> some View {
    Circle()
      .stroke(Color.gray)
      .frame(width: planetSize + radiusIncrement * index,
             height: planetSize + radiusIncrement * index)
  }

  func moon(planetSize: CGFloat, moonSize: CGFloat, radiusIncrement: CGFloat, index: CGFloat) -> some View {
    Circle()
      .fill(Color.orange)
      .frame(width: moonSize, height: moonSize)
  }

  func makeSystem(_ geometry: GeometryProxy) -> some View {
    let planetSize = geometry.size.height * 0.25
    let moonSize = geometry.size.height * 0.1
    let radiusIncrement = (geometry.size.height - planetSize - moonSize) / CGFloat(moons.count)
    let range = 1 ... moons.count
    return
      ZStack {
        Circle()
          .fill(planet.drawColor)
          .frame(width: planetSize, height: planetSize, alignment: .center)

        ForEach(range, id: \.self) { index in
          // orbit paths
          self.moonPath(planetSize: planetSize, radiusIncrement: radiusIncrement, index: CGFloat(index))
        }
        ForEach(range, id: \.self) { index in
          // individual "moon" circles
          self.moon(planetSize: planetSize, moonSize: moonSize, radiusIncrement: radiusIncrement, index: CGFloat(index))
          .modifier(self.makeOrbitEffect(diameter: planetSize + radiusIncrement * CGFloat(index)
          ))
          .animation(Animation
            .linear(duration: Double.random(in: 10 ... 100))
            .repeatForever(autoreverses: false)
          )
        }
        .onAppear {
          self.animationFlag.toggle()
        }
    }
  }
  
  func animation(index: Double) -> Animation {
    Animation
      .spring(response: 0.55, dampingFraction: 0.45, blendDuration: 0)
      .speed(2)
      .delay(0.075 * index)
  }
  
  func makeOrbitEffect(diameter: CGFloat) -> some GeometryEffect {
    OrbitEffect(angle: self.animationFlag ? 2 * .pi : 0, radius: diameter / 2.0)
  }
}

struct OrbitEffect: GeometryEffect {
  let initialAngle = CGFloat.random(in: 0 ..< 2 * .pi)

  var percent: CGFloat = 0
  let radius: CGFloat
  let angle: CGFloat
  
  init(angle: CGFloat, radius: CGFloat) {
    self.radius = radius
    self.angle = angle
  }

  var animatableData: CGFloat {
    get { return percent }
    set { percent = newValue }
  }

  func effectValue(size: CGSize) -> ProjectionTransform {
    let pt = CGPoint(
      x: cos(angle + initialAngle) * radius,
      y: sin(angle + initialAngle) * radius)
    let translation = CGAffineTransform(translationX: pt.x, y: pt.y)
    return ProjectionTransform(translation)
  }
}

#if DEBUG
struct SolarSystem_Previews: PreviewProvider {
  static var previews: some View {
    SolarSystem(planet: planets[5])
      .frame(width: 320, height: 240)
  }
}
#endif
