//
//  MyHealth.swift
//  Pillyze
//
//  Created by 권승용 on 7/13/24.
//

import SwiftUI

struct MyHealth: View {
    var body: some View {
        ZStack {
            Color(.appPrimary)
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                }
            }
            
            ExtractedView()
        }
    }
}

#Preview {
    MyHealth()
}

struct ExtractedView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                VStack {
                    Spacer()
                        .frame(height: proxy.safeAreaInsets.top)
                    Header()
                }
                .background {
                    Color(.appPrimary).opacity(0.5)
                }
                
                Spacer()
                
                
            }
            .ignoresSafeArea()
        }
    }
}
