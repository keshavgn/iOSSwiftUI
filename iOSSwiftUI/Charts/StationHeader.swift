//
//  StationHeader.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 04/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct StationHeader: View {
  var station: WeatherStation
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("Latitude: \(station.latitude.asLatitude)")
        Text("Longitude: \(station.longitude.asLongitude)")
        Text("Elevation: \(station.altitude) ft.")
      }
      Spacer()
      MapView(latitude: station.latitude, longitude: station.longitude)
        .frame(width: 200, height: 200)
    }
  }
}

struct StationHeader_Previews: PreviewProvider {
  static var previews: some View {
    StationHeader(station: WeatherInformation()!.stations[1])
  }
}
