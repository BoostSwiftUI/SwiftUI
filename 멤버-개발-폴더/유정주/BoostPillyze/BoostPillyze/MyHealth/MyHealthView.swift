//
//  MyHealthView.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/13/24.
//

import SwiftUI

struct MyHealthView: View {
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image(.logo)
                    Spacer()
                    HStack {
                        Button(
                            action: {},
                            label: { Image(.headerCalendar) }
                        )
                        Button(
                            action: {},
                            label: { Image(.headerNotification) }
                        )
                        Button(
                            action: {},
                            label: { Image(.headerProfile) }
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color.primaryNormal)
    }
}

// MARK: - Preview

#Preview {
    MyHealthView()
}
