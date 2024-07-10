//
//  PrimaryCategoryCell.swift
//  Coupang
//
//  Created by 권승용 on 7/6/24.
//

import SwiftUI

struct PrimaryCategoryCell: View {
    let symbolName: String
    let categoryName: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: symbolName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Text(categoryName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 1)
                .foregroundStyle(.primaryCategoryBackground)
                .shadow(radius: 1, y: 1)
        }
    }
}

#Preview {
    HStack {
        PrimaryCategoryCell(symbolName: "arrowshape.down.fill", categoryName: "최고 할인")
        PrimaryCategoryCell(symbolName: "tray.fill", categoryName: "로켓 배송")
    }
}
