//
//  ChartsView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 04/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct ChartsView: View {
  let stations = WeatherInformation()
  
  var body: some View {
    VStack {
      List(stations!.stations) { station in
        NavigationLink(destination: StationInfo(station: station)) {
          Text("\(station.name)")
        }
      }
      Text("Source: https://www.ncdc.noaa.gov/cdo-web/datasets")
        .italic()
    }.navigationBarTitle(Text("Weather Stations"), displayMode: .inline)
  }
}

struct ChartsView_Previews: PreviewProvider {
  static var previews: some View {
    ChartsView()
  }
}
