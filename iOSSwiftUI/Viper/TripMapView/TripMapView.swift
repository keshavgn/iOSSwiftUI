//
//  TripMapView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 07/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI

struct TripMapView: View {
  @ObservedObject var presenter: TripMapViewPresenter

  var body: some View {
    MapView(pins: presenter.pins, routes: presenter.routes, coordinate: nil)
  }
}

#if DEBUG
struct TripMapView_Previews: PreviewProvider {
  static var previews: some View {
    let model = DataModel.sample
    let trip = model.trips[0]
    let interactor = TripDetailInteractor(
      trip: trip,
      model: model,
      mapInfoProvider: RealMapDataProvider())
    let presenter = TripMapViewPresenter(interactor: interactor)
    return VStack {
      TripMapView(presenter: presenter)
    }
  }
}
#endif
