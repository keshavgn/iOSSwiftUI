//
//  SnowfallTab.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 04/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct SnowfallTab: View {
  var station: WeatherStation
  
  var body: some View {
    VStack {
      Text("Snowfall for 2018")
      SnowfallChart(measurements: station.measurements)
    }.padding()
  }
}

struct SnowfallTab_Previews: PreviewProvider {
  static var previews: some View {
    SnowfallTab(station: WeatherInformation()!.stations[1])
  }
}
