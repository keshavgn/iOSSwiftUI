//
//  MapView.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 04/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  let coordinate: CLLocationCoordinate2D
  
  init(latitude: Double, longitude: Double) {
    self.init(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
  }
  
  init(coordinate: CLLocationCoordinate2D) {
    self.coordinate = coordinate
  }

  func makeUIView(context: Context) -> MKMapView {
    MKMapView(frame: .zero)
  }
  
  func updateUIView(_ view: MKMapView, context: Context) {
    let span = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    
    view.setRegion(region, animated: true)
    view.mapType = .hybrid
    view.isScrollEnabled = false
    
    let annotation = MKPointAnnotation()
    annotation.coordinate = coordinate
    view.addAnnotation(annotation)
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(latitude: 34.011286, longitude: -116.166868)
  }
}
