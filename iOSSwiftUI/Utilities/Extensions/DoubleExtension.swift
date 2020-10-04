//
//  DoubleExtension.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 04/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation

extension Double {
  var stringToOneDecimal: String {
    String(format: "%.1f", self)
  }
  
  var stringToTwoDecimals: String {
    String(format: "%.2f", self)
  }

  var stringRounded: String {
    String(format: "%.f", self.rounded())
  }
  
  var asLatitude: String {
    let deg = floor(self)
    let min = fabs(self.truncatingRemainder(dividingBy: 1) * 60.0).rounded()
    if self > 0 {
      return String(format: "%.f° %.f\" N", deg, min)
    } else if self < 0 {
      return String(format: "%.f° %.f\" S", -deg, min)
    }
    
    return "0°"
  }
  
  var asLongitude: String {
    let deg = floor(self)
    let min = fabs(self.truncatingRemainder(dividingBy: 1) * 60.0).rounded()
    if self > 0 {
      return String(format: "%.f° %.f\" E", deg, min)
    } else if self < 0 {
      return String(format: "%.f° %.f\" W", -deg, min)
    }
    
    return "0°"
  }
}
