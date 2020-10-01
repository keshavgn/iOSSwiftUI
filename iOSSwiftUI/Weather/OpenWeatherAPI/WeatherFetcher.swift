//
//  WeatherFetcher.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 30/09/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation
import Combine

protocol WeatherFetchable {
  func weeklyWeatherForecast(forCity city: String) -> AnyPublisher<WeeklyForecastResponse, MyError>
  func currentWeatherForecast(forCity city: String) -> AnyPublisher<CurrentWeatherForecastResponse, MyError>
}

class WeatherFetcher: WeatherFetchable {
  func weeklyWeatherForecast(forCity city: String) -> AnyPublisher<WeeklyForecastResponse, MyError> {
    APIClient().forecast(with: makeWeeklyForecastComponents(withCity: city))
  }

  func currentWeatherForecast(forCity city: String) -> AnyPublisher<CurrentWeatherForecastResponse, MyError> {
    APIClient().forecast(with: makeCurrentDayForecastComponents(withCity: city))
  }
}

// MARK: - OpenWeatherMap API
private extension WeatherFetcher {
  enum OpenWeatherAPI {
    static let scheme = "https"
    static let host = "api.openweathermap.org"
    static let path = "/data/2.5"
    static let key = "6e3199e627ddbe7f1671bc20272da082"
  }
  
  func makeWeeklyForecastComponents(withCity city: String) -> URLComponents {
    urlComponents(with: city, path: "/forecast")
  }
  
  func makeCurrentDayForecastComponents(withCity city: String) -> URLComponents {
    urlComponents(with: city, path: "/weather")
  }
  
  func urlComponents(with city: String, path: String) -> URLComponents {
    var components = URLComponents()
    components.scheme = OpenWeatherAPI.scheme
    components.host = OpenWeatherAPI.host
    components.path = OpenWeatherAPI.path + path
    
    components.queryItems = [URLQueryItem(name: "q", value: city),
                             URLQueryItem(name: "mode", value: "json"),
                             URLQueryItem(name: "units", value: "metric"),
                             URLQueryItem(name: "APPID", value: OpenWeatherAPI.key)]
    return components
  }
}
