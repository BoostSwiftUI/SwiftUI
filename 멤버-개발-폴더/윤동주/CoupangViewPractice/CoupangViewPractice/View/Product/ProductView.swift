//
//  ProductView.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/12/24.
//

import SwiftUI

struct ProductView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isListMode = false
    @State var products: [Product]
    var columns: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: isListMode ? 1 : 2)
    }
    var isProductExist: Bool {
        products.isEmpty
    }
    
    var body: some View {
        if isProductExist {
            VStack {
                Text("해당 카테고리의 제품이 없습니다.")
            }
        } else {
            ScrollView(.vertical) {
                HStack {
                    Spacer()
                    Toggle("", isOn: $isListMode)
                        .tint(.black)
                }
                .padding(.horizontal, 12)
                LazyVGrid(columns: columns, content: {
                    ForEach(products, id: \.id) { product in
                            if isListMode {
                                NavigationLink {
                                    ProductDetailView(product: product)
                                } label: {
                                    ProductListView(product: product)
                                }

                            } else {
                                NavigationLink {
                                    ProductDetailView(product: product)
                                } label: {
                                    ProductGridView(product: product)
                                }
                            }
                        }
                })
            }
            .frame(maxWidth: .infinity)
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}
//
//#Preview {
//    ProductView()
//}
