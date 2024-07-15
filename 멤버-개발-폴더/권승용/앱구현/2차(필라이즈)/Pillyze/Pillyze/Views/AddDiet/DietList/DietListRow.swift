//
//  DietListRow.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import SwiftUI

struct DietListRow: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("1")
                .font(.system(size: 16))
                .fontWeight(.heavy)
                .foregroundStyle(.textNormal)
            
            HStack(spacing: 6) {
                Image(.rankMaintain)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                
                VStack(alignment: .leading) {
                    Text("흰쌀밥")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .foregroundStyle(.textNormal)
                    Text("1공기(210g)")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .foregroundStyle(.textSecondary)
                }
            }
            .padding(.leading, 12)
            
            Spacer()
            
            HStack(spacing: 12) {
                Text("95kcal")
                Image(.dietUnselected)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
        }
    }
}

#Preview {
    DietListRow()
}
