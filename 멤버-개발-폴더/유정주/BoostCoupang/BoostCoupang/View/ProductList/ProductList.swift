//
//  ProductList.swift
//  BoostCoupang
//
//  Created by 유정주 on 7/7/24.
//

import SwiftUI

struct ProductList: View {
    
    // MARK: - Body
    
    @State private var isListMode = false
    @State private var isBestDiscount: Bool
    @State private var isRocketDelivery: Bool
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            
            Toggle(isOn: $isBestDiscount, label: {
                Text("최고 할인")
            })
            .foregroundStyle(.red)
            .toggleStyle(.button)
            
            Toggle(isOn: $isRocketDelivery, label: {
                Text("로켓 배송")
            })
            .toggleStyle(.button)
            
            Button(action: {
                isListMode.toggle()
            }) {
                let imageName = isListMode ? "list.bullet" : "square.grid.2x2.fill"
                Image(systemName: imageName)
            }
            .padding(.horizontal)
        }
        
        Divider()

        if filteredProducts.isEmpty {
            Spacer()
            Text("상품이 없습니다.")
                .navigationTitle(categoryName ?? "")
            Spacer()
        } else {
            ScrollView {
                let columnsCount = isListMode ? 1 : 2
                let columns = Array(repeating: GridItem(.flexible()), count: columnsCount)
                
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(filteredProducts) { product in
                        if isListMode {
                            NavigationLink(destination: {
                                ProductDetail(product: product)
                            }, label: {
                                ProductListCell(product: product)
                            })
                            .foregroundStyle(.black)
                        } else {
                            NavigationLink(destination: {
                                ProductDetail(product: product)
                            }, label: {
                                ProductGridCell(product: product)
                            })
                            .foregroundStyle(.black)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(categoryName ?? "")
        }
    }
    
    // MARK: - Attribute
    
    let categoryName: String?
    private let products = ModelData().products
    private var filteredProducts: [Product] {
        var filteredProducts = products
        if let categoryName {
            filteredProducts = filteredProducts.filter {
                $0.categories.contains(where: { $0 == categoryName })
            }
        }
        if isBestDiscount {
            filteredProducts = filteredProducts.filter {
                $0.discountRate >= 20
            }
        }
        if isRocketDelivery {
            filteredProducts = filteredProducts.filter {
                $0.isRocketDelivery
            }
        }
        return filteredProducts
    }
    
    // MARK: - Initializer
    
    init(categoryName: String?, isBestDiscount: Bool = false, isRocketDelivery: Bool = false) {
        self.categoryName = categoryName
        self.isBestDiscount = isBestDiscount
        self.isRocketDelivery = isRocketDelivery
    }
}

#Preview {
    ProductList(categoryName: "Technology")
}
