//
//  CategoryView.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/8/24.
//

import SwiftUI

struct CategoryView: View {
    
    @Environment(ModelData.self) var modelData
    
    struct CategoryItem: Identifiable, Hashable {
        let id = UUID()
        let icon: String
        let title: String
    }
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                CategoryProductBoxButton(image: Image(systemName: "arrowshape.down"),
                                         buttonTitle: "내 할인",
                                         action: { print("내 할인 버튼 클릭됨.") }
                )
                .foregroundStyle(.black)
                CategoryProductBoxButton(image: Image(systemName: "bicycle"),
                                         buttonTitle: "로켓배송",
                                         action: { print("로켓배송 버튼 클릭됨.") }
                )
                .foregroundStyle(.black)
            }
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(0...modelData.categories.count / 2, id: \.self) { index in
                        HStack {
                            CategoryItemButton(category: modelData.categories[index*2])
                            Divider()
                                .frame(height: 40)
                            CategoryItemButton(category: index*2+1 < modelData.categories.count ? modelData.categories[1+index*2]: Category(name: "", icon: ""))
                        }
                        .frame(height: 60)
                        .overlay(
                            Group {
                                if index == 0 {
                                    Divider()
                                }
                            },
                            alignment: .top
                        )
                        .overlay(Divider(), alignment: .bottom)
                        .background(Color.white)
                    }
                }
            }
        }
        .padding(.horizontal, 6)
    }
}

#Preview {
    CategoryView()
        .environment(ModelData())
}
