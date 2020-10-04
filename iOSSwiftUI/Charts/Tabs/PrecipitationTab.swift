//
//  PrecipitationTab.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 04/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct PrecipitationTab: View {
  var station: WeatherStation
  
  func monthFromName(_ name: String) -> Int {
    let df = DateFormatter()
    df.dateFormat = "LLLL"
    if let date = df.date(from: name) {
      return Calendar.current.component(.month, from: date)
    }
    return 0
  }
    
  var body: some View {
    VStack {
      Text("Precipitation for 2018")
      PrecipitationChart(measurements: station.measurements)
    }.padding()
  }
}

struct PrecipitationTab_Previews: PreviewProvider {
  static var previews: some View {
    PrecipitationTab(station: WeatherInformation()!.stations[1])
  }
}
