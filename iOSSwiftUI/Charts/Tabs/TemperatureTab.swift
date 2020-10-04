//
//  TemperatureTab.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 04/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct TemperatureTab: View {
  var station: WeatherStation
  
  var body: some View {
    VStack {
      Text("Temperatures for 2018")
      TemperatureChart(measurements: station.measurements)
    }.padding()  }
}

struct TemperatureTab_Previews: PreviewProvider {
  static var previews: some View {
    TemperatureTab(station: WeatherInformation()!.stations[0])
  }
}
