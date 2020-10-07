//
//  TripListRouter.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 06/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation
import SwiftUI

class TripListRouter {
  func makeDetailView(for trip: Trip, model: DataModel) -> some View {
    let presenter = TripDetailPresenter(interactor:
      TripDetailInteractor(trip: trip, model: model, mapInfoProvider: RealMapDataProvider()))
    return TripDetailView(presenter: presenter)
  }
}
