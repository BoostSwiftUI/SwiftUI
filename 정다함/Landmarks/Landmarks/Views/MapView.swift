//
//  MapView.swift
//  Landmarks
//
//  Created by MaraMincho on 7/2/24.
//

import SwiftUI
import MapKit

struct MapView: View {
  var coordinate: CLLocationCoordinate2D
  var body: some View {
    Map(position: .constant(.region(region)))
  }

  private var region: MKCoordinateRegion {
    MKCoordinateRegion(
      center: coordinate,
      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
  }
}

struct CustomView: View {
  var body: some View {
    Color
      .blue
      .frame(maxWidth: .infinity,idealHeight: 200)
  }
}
