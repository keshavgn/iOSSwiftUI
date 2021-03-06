//
//  DailyWeatherRowViewModel.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 30/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation
import SwiftUI

struct DailyWeatherRowViewModel: Identifiable {
  private let item: WeeklyForecastResponse.Item
  
  var id: String {
    day + temperature + title
  }
  
  var day: String {
    dayFormatter.string(from: item.date)
  }
  
  var month: String {
    monthFormatter.string(from: item.date)
  }
  
  var temperature: String {
    String(format: "%.1f", item.main.temp)
  }
  
  var title: String {
    guard let title = item.weather.first?.main.rawValue else { return "" }
    return title
  }
  
  var fullDescription: String {
    guard let description = item.weather.first?.weatherDescription else { return "" }
    return description
  }
  
  init(item: WeeklyForecastResponse.Item) {
    self.item = item
  }
}

// Used to hash on just the day in order to produce a single view model for each
// day when there are multiple items per each day.
extension DailyWeatherRowViewModel: Hashable {
  static func == (lhs: DailyWeatherRowViewModel, rhs: DailyWeatherRowViewModel) -> Bool {
    return lhs.day == rhs.day
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.day)
  }
}
