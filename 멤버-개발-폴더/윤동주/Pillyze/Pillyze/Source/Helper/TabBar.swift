//
//  TabBar.swift
//  Pillyze
//
//  Created by 윤동주 on 7/18/24.
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedTab: TabCategory
    @Binding var isAddSheetShown: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                TabBarButton(selectedImage: .myHealthDefault,
                             unselectedImage: .myHealthDisabled,
                             title: "내 건강",
                             isSelected: selectedTab == .myHealth)
                .onTapGesture {
                    self.selectedTab = .myHealth
                }
                Spacer()
                Button {
                    isAddSheetShown.toggle()
                } label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(.primaryPurple)
                            .frame(width: 56, height: 56)
                        Image(.plus)
                    }
                    .offset(y: -20)
                }
                Spacer()
                TabBarButton(selectedImage: .nutrientsDefault,
                             unselectedImage: .nutrientsDisabled,
                             title: "영양제",
                             isSelected: selectedTab == .nutrients)
                .onTapGesture {
                    self.selectedTab = .nutrients
                }
            }
        }
        .frame(height: 81)
        .padding(.horizontal, 48)
        .background(
            Color.white
                .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
                .shadow(color: .primaryPurple.opacity(0.1), radius: 24, x: 0, y: 0)
        )
    }
    
    @ViewBuilder
    func TabBarButton(selectedImage: ImageResource,
                      unselectedImage: ImageResource,
                      title: String,
                      isSelected: Bool) -> some View {
        VStack(spacing: 8) {
            Image(isSelected ? selectedImage : unselectedImage)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(isSelected ? .primaryPurple : .placeholderGray)
            Text(title)
                .font(.Pretendard.regular(.size12).font)
                .foregroundStyle(isSelected ? .primaryPurple : .placeholderGray)
        }
        .frame(width: 82, height: 60)
    }
}

#Preview {
    TabBar(selectedTab: .constant(.myHealth),
           isAddSheetShown: .constant(false))
}
