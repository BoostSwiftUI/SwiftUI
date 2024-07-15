//
//  AddDietView.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/14/24.
//

import SwiftUI
import Combine

struct AddDietView: View {
    
    // MARK: - Interface

    @ObservedObject var output: AddDietViewModel.Output
    
    let didTapCancelButton = PassthroughSubject<Void, Never>()

    // MARK: - State
    
    @State private var searchKeyword = ""
    
    var body: some View {
        SearchHeaderView(
            didTapCancelButton: didTapCancelButton,
            searchKeyword: $searchKeyword
        )
        .padding(.horizontal)
        
        ScrollView {
            VStack {
                ForEach(output.foods) { food in
                    Text(food.name)
                }
            }
        }
    }
}

// MARK: - Search Header

private struct SearchHeaderView: View {
    
    let didTapCancelButton: PassthroughSubject<Void, Never>
    
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
                action: {
                    didTapCancelButton.send()
                },
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
    AddDietView(output: AddDietViewModel().output)
}
