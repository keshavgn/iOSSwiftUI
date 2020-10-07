//
//  TripDetailRouter.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 07/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import Foundation
import SwiftUI

class TripDetailRouter {
  private let mapProvider: MapDataProvider
  
  init(mapProvider: MapDataProvider) {
    self.mapProvider = mapProvider
  }
  
  func makeWaypointView(for waypoint: Waypoint) -> some View {
    let presenter = WaypointViewPresenter(
      waypoint: waypoint,
      interactor: WaypointViewInteractor(
        waypoint: waypoint,
        mapInfoProvider: mapProvider))
    return WaypointView(presenter: presenter)
  }
}
