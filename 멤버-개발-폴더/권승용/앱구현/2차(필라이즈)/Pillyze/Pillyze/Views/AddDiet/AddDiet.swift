//
//  AddDiet.swift
//  Pillyze
//
//  Created by 권승용 on 7/13/24.
//

import SwiftUI

struct AddDiet: View {
    let foods: [Food]
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack {
                    searchBar()
                    FrequentlyEaten(foods: foods)
                }
                
                VStack {
                    Spacer()
                    BottomPicker()
                        .padding(.bottom, proxy.safeAreaInsets.bottom)
                        .background {
                            Color(.componentBackground)
                        }
                }
                .ignoresSafeArea()
            }
        }
    }
    
    @ViewBuilder
    func searchBar() -> some View {
        HStack {
            SearchTextField()
            Button {
                
            } label: {
                Text("취소")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .foregroundStyle(.textNormal)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    AddDiet(foods: ModelData().foods)
}
