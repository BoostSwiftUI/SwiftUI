//
//  AddDietView.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/14/24.
//

import SwiftUI

struct AddDietView: View {
    
    @State private var searchKeyword = ""
    
    var body: some View {
        SearchHeaderView(searchKeyword: $searchKeyword)
            .padding(.horizontal)
        
        Spacer()
    }
}

// MARK: - Search Header

private struct SearchHeaderView: View {
    
    @Binding var searchKeyword: String
    
    var body: some View {
        HStack {
            HStack(spacing: 0) {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 16)
                TextField("음식명으로 검색", text: $searchKeyword)
                    .padding(.vertical)
                    .padding(.horizontal, 4)
            }
            .background(Color.primaryPlaceholder)
            .clipShape(Capsule())
            
            Button(
                action: {},
                label: {
                    Text("취소")
                        .font(.system(size: 15))
                }
            )
            .foregroundStyle(.black)
        }
    }
}

// MARK: - Preview

#Preview {
    AddDietView()
}
