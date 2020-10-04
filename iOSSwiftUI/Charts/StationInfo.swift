//
//  StationInfo.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 04/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct StationInfo: View {
  var station: WeatherStation
  
    var body: some View {
      VStack {
        StationHeader(station: self.station)
        TabView {
          TemperatureTab(station: self.station)
            .tabItem({
              Image(systemName: "thermometer")
              Text("Temperatures")
            })
          SnowfallTab(station: self.station)
            .tabItem({
              Image(systemName: "snow")
              Text("Snowfall")
            })
            PrecipitationTab(station: self.station)
            .tabItem({
              Image(systemName: "cloud.rain")
              Text("Precipitation")
            })
        }
        }.navigationBarTitle(Text("\(station.name)"), displayMode: .inline).padding()
    }
}

struct StationInfo_Previews: PreviewProvider {
    static var previews: some View {
      StationInfo(station: WeatherInformation()!.stations[0])
    }
}

