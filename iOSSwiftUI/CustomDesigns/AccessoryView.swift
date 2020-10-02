//
//  AccessoryView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 02/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct AccessoryView: View {
  let uuid = UUID()
  var title: String
  var image: Image
  
  var body: some View {
    VStack {
      LinearGradient.lairHorizontalDark
        .mask(image.resizable().scaledToFit())
        .frame(width: 150, height: 236)
        .padding(40)
        .font(.system(size: 150, weight: .thin))
        .shadow(color: .white, radius: 2, x: -3, y: -3)
        .shadow(color: .lairShadowGray, radius: 2, x: 3, y: 3)
      
      HStack {
        Text(title)
          .bold()
          .padding(.leading)
          .padding(.bottom)
          .foregroundColor(.lairDarkGray)
        Spacer()
      }
    }
    .frame(width: 230)
    .overlay(
      RoundedRectangle(cornerRadius: 15)
        .stroke(LinearGradient.lairDiagonalDarkBorder, lineWidth: 2)
    )
    .background(Color.lairBackgroundGray)
    .cornerRadius(15)
    .shadow(color: Color(white: 1.0).opacity(0.9), radius: 18, x: -18, y: -18)
    .shadow(color: Color.lairShadowGray.opacity(0.5), radius: 14, x: 14, y: 14)
  }
}

struct AccessoryView_Previews: PreviewProvider {
  static var previews: some View {
    AccessoryView(title: "Control Room", image: Image(systemName: "lock.shield"))
  }
}
