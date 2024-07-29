//
//  SearchNavigatorView.swift
//  Pillyze
//
//  Created by 윤동주 on 7/18/24.
//

import SwiftUI

struct SearchNavigatorView: View {
    
    @State private var searchQuery = ""
    
    @Binding var isRecordSheetShown: Bool
    
    var body: some View {
        HStack {
            HStack(spacing: 0) {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 16)
                TextField("음식명,브랜드명으로 검색", text: $searchQuery)
                    .font(.Pretendard.regular(.size14).font)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .padding(.leading, 4)
                    .padding(.trailing, 16)
                    
            }
            .foregroundStyle(.placeholderGray)
            .background(Color.placeholderPurple)
            .clipShape(Capsule())
            
            Button(
                action: {
                    self.isRecordSheetShown.toggle()
                },
                label: {
                    Text("취소")
                        .font(.Pretendard.medium(.size16).font)
                }
            )
            .foregroundStyle(.black)
        }
        
    }
}

#Preview {
    SearchNavigatorView(isRecordSheetShown: .constant(true))
}
