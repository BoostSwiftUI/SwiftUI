//
//  MyHealthView.swift
//  Pillyze
//
//  Created by 이준복 on 7/15/24.
//

import SwiftUI

struct MyHealthView: View {
    var body: some View {
        ZStack {
            VStack {
                Color(.primaryNormal)
            }
            .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    MyHealthHeaderView()
                }
            }
        }
    }
}

#Preview {
    MyHealthView()
}
