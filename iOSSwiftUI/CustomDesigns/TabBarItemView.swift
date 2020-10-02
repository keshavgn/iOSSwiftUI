//
//  TabBarItemView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 02/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//


import SwiftUI

struct TabBarItemView: View {
  @Binding var selectedItem: SmartView
  
  let uuid = UUID()
  var smartView: SmartView
  var icon: String
  let size: CGFloat = 32
  
  func isSelected() -> Bool {
    return selectedItem == smartView
  }
  
  var body: some View {
    Button(action: {
      self.selectedItem = self.smartView
    }) {
      // This is the new stuff!
      if isSelected() {
        buttonDown
      } else {
        buttonUp
      }
    }
  }
  
  var buttonUp: some View {
    var buttonMask: some View {
      ZStack {
        Rectangle()
          .foregroundColor(.white)
          .shadow(color: .lairShadowGray, radius: 3, x: 3, y: 3)
          .shadow(color: .white, radius: 3, x: -3, y: -3)
          .clipShape(RoundedRectangle(cornerRadius: size * 8 / 16))
          .frame(width: size * 2, height: size * 2)
//          .cornerRadius(size * 8 / 16)

        Image(systemName: self.icon)
          .resizable()
          .scaledToFit()
          .frame(width: size, height: size)
      }
      .compositingGroup()
      .shadow(color: Color.white.opacity(0.9), radius: 10, x: -5, y: -5)
      .shadow(color: Color.lairShadowGray.opacity(0.5), radius: 10, x: 5, y: 5)
    }
    
    var button: some View {
      ZStack {
        LinearGradient.lairHorizontalDarkReverse
        .frame(width: size, height: size)
        
        Rectangle()
          .inverseMask(buttonMask)
          .frame(width: size * 2, height: size * 2)
          .foregroundColor(.lairBackgroundGray)
        }
      }

    return button
  }

  var buttonDown: some View {
    ZStack {
      Rectangle()
      .foregroundColor(.lairBackgroundGray)
      .frame(width: size * 2.5, height: size * 2.5)
      .cornerRadius(size * 8 / 16)
      .inverseMask(Rectangle()
        .cornerRadius(size * 6 / 16)
        .padding(size / 8)
      )
      .shadow(
        color: Color.lairShadowGray.opacity(0.7),
        radius: size * 0.1875,
        x: size * 0.1875,
        y: size * 0.1875)
      .shadow(
        color: Color(white: 1.0).opacity(0.9),
        radius: size * 0.1875,
        x: -size * 0.1875,
        y: -size * 0.1875)
      .clipShape(RoundedRectangle(cornerRadius: size * 8 / 16))
      
      Rectangle()
        .foregroundColor(.lairBackgroundGray)
        .frame(width: size * 2.25, height: size * 2.25)
        .cornerRadius(size * 8 / 16)
      
      LinearGradient.lairHorizontalDarkReverse
      .frame(width: size, height: size)
      .mask(Image(systemName: self.icon)
        .resizable()
        .scaledToFit()
      )
      .shadow(
        color: Color.lairShadowGray.opacity(0.5),
        radius: size * 0.1875,
        x: size * 0.1875,
        y: size * 0.1875)
      .shadow(
        color: Color(white: 1.0).opacity(0.9),
        radius: size * 0.1875,
        x: -size * 0.1875,
        y: -size * 0.1875)
    }
    .overlay(
    RoundedRectangle(cornerRadius: size * 8 / 16)
      .stroke(LinearGradient.lairDiagonalLightBorder, lineWidth: 2)
    )
  }
}

struct TabBarItemView_Previews: PreviewProvider {
  static var previews: some View {
    TabBarItemView(selectedItem: .constant(SmartView.lair), smartView: .lair, icon: "pencil.tip")
  }
}
