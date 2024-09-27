//
//  AnalyzeCalory.swift
//  Pillyze
//
//  Created by 권승용 on 8/31/24.
//

import SwiftUI

struct AnalyzeCalory: View {
    @Environment(ModelData.self) private var modelData
    
    var body: some View {
        ZStack {
            Color.appPrimaryBackground
            
            ScrollView {
                VStack(spacing: 0) {
                    CapturePhoto()
                    CaloryChart()
                        .padding(.bottom, 10)
                    SelectedFoodList()
                    InfoText()
                }
            }
        }
    }
 
}

#Preview {
    AnalyzeCalory()
        .environment(ModelData())
}
