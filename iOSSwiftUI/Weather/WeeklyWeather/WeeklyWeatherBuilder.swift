//
//  WeeklyWeatherBuilder.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 30/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

enum WeeklyWeatherBuilder {
  static func makeCurrentWeatherView(withCity city: String, weatherFetcher: WeatherFetchable) -> some View {
    let viewModel = CurrentWeatherViewModel(city: city, weatherFetcher: weatherFetcher)
    return CurrentWeatherView(viewModel: viewModel)
  }
}
