//
//  DayInfo.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 04/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation

struct DayInfo : Identifiable {
  var date: Date
  var precipitation: Double
  var snowfall: Double
  var high: Double
  var low: Double
  
  var id: Date {
    date
  }
  
  var dateString: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M/d/yyyy"
    return dateFormatter.string(from: date)
  }
}
