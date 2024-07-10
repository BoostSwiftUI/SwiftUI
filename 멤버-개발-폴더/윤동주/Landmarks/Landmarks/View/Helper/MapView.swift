//
//  MapView.swift
//  Landmarks
//
//  Created by 윤동주 on 7/2/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
    
    var body: some View {
        // 초기 지도 중심 지점을 설정 외에도 이후 변경되는 지점들을 Binding으로 위치 동기화 가능.
        
//         Map(initialPosition: .region(region))
        Map(position: .constant(.region(region)))
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868))
}
