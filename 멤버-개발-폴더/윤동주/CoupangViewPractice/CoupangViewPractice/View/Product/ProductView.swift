//
//  ProductView.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/12/24.
//

import SwiftUI

struct ProductView: View {
    @State private var isListMode = false
    @State var products: [Product]
    var columns: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: isListMode ? 1 : 2)
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, content: {
                if !isListMode {
                    ForEach(products, id: \.self) {
                        ProductGridView(product: $0)
                    }
                }
            })
        }
    }
}
//
//#Preview {
//    ProductView()
//}
