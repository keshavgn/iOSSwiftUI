//
//  PrecipitationChart.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 04/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct PrecipitationChart: View {
  var measurements: [DayInfo]
  
    var body: some View {
        HStack {
          ForEach(0..<12) { month in
            VStack {
              
              Spacer()
              Text("\(self.sumPrecipitation(month).stringToOneDecimal)")
              .font(.footnote)
              .rotationEffect(.degrees(-90))
              .offset(y: self.sumPrecipitation(month) < 2.4 ? 0 : 35)
              .zIndex(1)
              Rectangle()
                .fill(Color.green)
                .frame(width: 20, height: CGFloat(self.sumPrecipitation(month)) * 15.0)

              Text("\(self.monthAbbreviationFromInt(month))")
                .font(.system(size: 10))
                .frame(height: 20)
            }
          }
        }
    }
  
  func sumPrecipitation(_ month: Int) -> Double {
    self.measurements.filter {
      Calendar.current.component(.month, from: $0.date) == month + 1
    }.reduce(0, { $0 + $1.precipitation })
  }

  func monthAbbreviationFromInt(_ month: Int) -> String {
    let ma = Calendar.current.shortMonthSymbols
    return ma[month]
  }
}

struct PrecipitationChart_Previews: PreviewProvider {
    static var previews: some View {
        PrecipitationChart(measurements: WeatherInformation()!.stations[2].measurements)
    }
}
