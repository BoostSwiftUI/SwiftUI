//
//  AllCategoryCell.swift
//  Coupang
//
//  Created by 권승용 on 7/7/24.
//

import SwiftUI

struct AllCategoryCell: View {
    let category: ProductCategory
    
    var body: some View {
        HStack {
            Label {
                Text(category.categoryName)
            } icon: {
                Text(category.categoryIcon)
            }
            .font(.system(size: 18))
            
            Spacer()
        }
        .padding(.leading)
    }
}

#Preview {
    let category = ProductCategory.sample
    return AllCategoryCell(category: category)
}
