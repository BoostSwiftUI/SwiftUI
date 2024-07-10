//
//  MapView.swift
//  Landmarks
//
//  Created by 이준복 on 7/4/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    private var region: MKCoordinateRegion {
        .init(
            center: coordinate,
            span: .init(
                latitudeDelta: 0.2,
                longitudeDelta: 0.2
            )
        )
    }
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
