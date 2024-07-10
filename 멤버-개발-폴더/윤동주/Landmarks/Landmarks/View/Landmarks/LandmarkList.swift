//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 윤동주 on 7/2/24.
//

import SwiftUI

struct LandmarkList: View {
    
    @State var showFavoriteOnly = false
    @Environment(ModelData.self) var modelData
    
    var filteredLandmarks: [Landmark] {
        // landmarks는 전역변수로 어디서든 접근이 가능.
        modelData.landmarks.filter { landmark in
            !showFavoriteOnly || landmark.isFavorite
        }
    }
    
    var body: some View {
        // NavigationSplitView는 iPad 같은 곳에서 사이드바로 반영됨.
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            // 샤라락 생기고 사라지는 효과
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
