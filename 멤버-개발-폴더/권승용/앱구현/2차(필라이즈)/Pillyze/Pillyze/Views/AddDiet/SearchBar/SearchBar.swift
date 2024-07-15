//
//  SearchBar.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText: String = ""
    
    var body: some View {
        HStack(spacing: 4) {
            Image(.search)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
            TextField("음식명, 브랜드명으로 검색", text: $searchText)
                .font(.system(size: 14))
                .textInputAutocapitalization(.never)
        }
        .padding(16)
        .background {
            RoundedRectangle(cornerRadius: 99)
                .foregroundStyle(.appPrimaryPlaceholder)
        }
    }
}

#Preview {
    SearchBar()
}
