//
//  MoonView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 03/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct MoonView: View {
  @State var angle: CGFloat = -CGFloat.pi / 2
  let size: CGFloat
  let radius: CGFloat
  let targetAngle: CGFloat

  init(angle: CGFloat, size: CGFloat, radius: CGFloat) {
    self.targetAngle = angle
    self.size = size
    self.radius = radius
    self.angle = angle
  }

  var body: some View {
    return Circle()
      .fill(Color.orange)
      .frame(width: size, height: size)
      .offset(x: radius * cos(angle),
              y: radius * sin(angle))
      .onAppear {
        withAnimation {
          self.angle = self.targetAngle
        }
    }
  }
}
