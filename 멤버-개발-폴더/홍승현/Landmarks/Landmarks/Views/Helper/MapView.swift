//
//  MapView.swift
//  Landmarks
//
//  Created by 홍승현 on 7/2/24.
//

import SwiftUI
import MapKit

struct MapView: View {

  var coordinate: CLLocationCoordinate2D

  var body: some View {
    Map(initialPosition: .region(region))
  }

  private var region: MKCoordinateRegion {
    .init(
      center: coordinate,
      span: .init(latitudeDelta: 0.2, longitudeDelta: 0.5)
    )
  }
}

#Preview {
  MapView(coordinate: .init(latitude: 34.011_286, longitude: -116.166_868))
}
