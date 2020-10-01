//
//  CurrentWeatherRowViewModel.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 30/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

struct CurrentWeatherRowViewModel {
  private let item: CurrentWeatherForecastResponse
  
  var temperature: String {
    String(format: "%.1f", item.main.temperature)
  }
  
  var maxTemperature: String {
    String(format: "%.1f", item.main.maxTemperature)
  }
  
  var minTemperature: String {
    String(format: "%.1f", item.main.minTemperature)
  }
  
  var humidity: String {
    String(format: "%.1f", item.main.humidity)
  }
  
  var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D.init(latitude: item.coord.lat, longitude: item.coord.lon)
  }
  
  init(item: CurrentWeatherForecastResponse) {
    self.item = item
  }
}
