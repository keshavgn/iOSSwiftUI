//
//  ViewExtension.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 03/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

extension View {
  func inverseMask<Mask>(_ mask: Mask) -> some View where Mask: View {
    self.mask(mask
      .foregroundColor(.black)
      .background(Color.white)
      .compositingGroup()
      .luminanceToAlpha()
    )
  }
}
