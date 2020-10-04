//
//  WeatherStation.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 04/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation

struct WeatherStation: Identifiable {
  var id: String
  var name: String
  var latitude: Double
  var longitude: Double
  var altitude: Int
  var measurements: [DayInfo]
    
  func measurementsInMonth(_ month: Int) -> [DayInfo] {
    return measurements.filter {
      return Calendar.current.component(.month, from: $0.date) == month
    }
  }
  
  var lowTemperatureForYear: Double {
    measurements.min(by: { $0.low < $1.low })!.low
  }
  
  var highTemperatureForYear: Double {
    measurements.max(by: { $0.high < $1.high })!.high
  }
}
