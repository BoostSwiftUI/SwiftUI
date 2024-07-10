//
//  Home.swift
//  Coupang
//
//  Created by 권승용 on 7/6/24.
//

import SwiftUI

struct Home: View {
    let model: ModelData
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    PrimaryCategories(products: model.products)
                        .padding(.horizontal)
                    AllCategories(products: model.products, categories: model.categories)
                }
            }
        }
        .navigationTitle("Coupang Clone")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        Home(model: ModelData())
    }
}
