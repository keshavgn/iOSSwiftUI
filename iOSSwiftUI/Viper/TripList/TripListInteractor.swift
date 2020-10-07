//
//  TripListInteractor.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 06/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation

class TripListInteractor {
  let model: DataModel

  init (model: DataModel) {
    self.model = model
  }
  
  func addNewTrip() {
    model.pushNewTrip()
  }
  
  func deleteTrip(_ index: IndexSet) {
    model.trips.remove(atOffsets: index)
  }
}
