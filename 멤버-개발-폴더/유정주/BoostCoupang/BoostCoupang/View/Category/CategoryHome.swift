//
//  CategoryHome.swift
//  BoostCoupang
//
//  Created by 유정주 on 7/6/24.
//

import SwiftUI

struct CategoryHome: View {
    
    private let categories = ModelData().categories
    private let columns = [GridItem(.flexible())]
    
    struct CategoryDivider: View {
        
        var body: some View {
            Divider()
                .frame(height: 2)
                .background(ColorStyle.divider)
        }
    }
    
    struct CategoryListItem: View {
        
        let category: Category
        
        var body: some View {
            NavigationLink(destination: {
                ProductList(categoryName: category.name)
            }, label: {
                CategoryItem(category: category)
            })
            .foregroundStyle(ColorStyle.categoryTitle)
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    NavigationLink(destination: {
                        ProductList(categoryName: nil, isBestDiscount: true)
                    }, label: {
                        TopCategoryButton(iconName: IconName.percent, title: Text.Title.percent)
                    })
                    .foregroundStyle(.black)
                    
                    NavigationLink(destination: {
                        ProductList(categoryName: nil, isRocketDelivery: true)
                    }, label: {
                        TopCategoryButton(iconName: IconName.roketDelivery, title: Text.Title.roketDelivery)
                    })
                    .foregroundStyle(.black)
                }
                .padding()
                
                Divider()
                
                LazyVGrid(columns: columns) {
                    ForEach(0..<(categories.count / 2), id: \.self) { index in
                        HStack {
                            CategoryListItem(category: categories[index * 2])
                            
                            Divider().frame(width: 1)
                            
                            CategoryListItem(category: categories[index * 2 + 1])
                        }
                        .frame(height: Metric.categoryHeight)
                        
                        CategoryDivider()
                    }
                    
                    CategoryListItem(category: categories[categories.count - 1])
                    
                    CategoryDivider()
                }
                .padding(.horizontal)
            }
        }
    }
}

// MARK: - Constant

private extension CategoryHome {
    
    enum Text {
        
        enum Title {
            
            static let percent = "최고 할인"
            static let roketDelivery = "로켓 배송"
        }
    }
    
    enum IconName {
        
        static let percent = "percent"
        static let roketDelivery = "truck.box.badge.clock.fill"
    }
    
    enum Metric {
        
        static let categoryHeight: CGFloat = 40
    }
    
    enum ColorStyle {
        
        static let categoryTitle = Color.black
        static let divider = Color.gray.opacity(0.1)
    }
}


#Preview {
    CategoryHome()
}
