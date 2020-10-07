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
  var pins: [MKAnnotation] = []
  var routes: [MKRoute]?
  var coordinate: CLLocationCoordinate2D?

  init(pins: [MKAnnotation], routes: [MKRoute]?, coordinate: CLLocationCoordinate2D?) {
    self.pins = pins
    self.routes = routes
    self.coordinate = coordinate
  }

  init(latitude: Double, longitude: Double) {
    self.init(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
  }

  init(coordinate: CLLocationCoordinate2D) {
    self.coordinate = coordinate
  }

  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView()
    mapView.delegate = context.coordinator
    return mapView
  }

  func updateUIView(_ view: MKMapView, context: Context) {
    view.removeAnnotations(view.annotations)
    view.removeOverlays(view.overlays)
    if let center = coordinate {
      view.setRegion(MKCoordinateRegion(center: center, latitudinalMeters: 2000, longitudinalMeters: 2000), animated: true)
      view.addAnnotation( {
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        return annotation
        }())
    }
    if pins.count > 0 {
      view.addAnnotations(pins)
      view.showAnnotations(pins, animated: false)
    }
    if let routes = routes {
      routes.forEach { route in
        view.addOverlay(route.polyline, level: .aboveRoads)
      }
    }
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView

    init(_ parent: MapView) {
      self.parent = parent
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
      guard let polyline = overlay as? MKPolyline else {
        return MKOverlayRenderer(overlay: overlay)
      }

      let lineRenderer = MKPolylineRenderer(polyline: polyline)
      lineRenderer.strokeColor = .blue
      lineRenderer.lineWidth = 3

      return lineRenderer
    }
  }
}

fileprivate class CoordinateWrapper: NSObject, MKAnnotation {
  var coordinate: CLLocationCoordinate2D

  init(_ coordinate: CLLocationCoordinate2D) {
    self.coordinate = coordinate
  }
}

#if DEBUG
struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(latitude: 34.011286, longitude: -116.166868)
  }
}
#endif
