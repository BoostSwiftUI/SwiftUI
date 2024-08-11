//
//  UserSexFilterView.swift
//  Pillyze
//
//  Created by 윤동주 on 7/30/24.
//

import SwiftUI

struct UserSexFilterView: View {
    
    @Binding var userSex: UserSex
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Menu {
                    ForEach(UserSex.allCases, id: \.self) { sex in
                        Button {
                            self.userSex = sex
                        } label: {
                            Text("\(sex.rawValue)")
                        }
                    }
                } label: {
                    HStack {
                        Text(userSex.rawValue)
                        Image(.arrowDownGray)
                    }
                }
                
                Text("유저들이 자주 먹어요🔥")
                Spacer()
            }
            .foregroundStyle(.black)
            .font(.Pretendard.bold(.size16).font)
            HStack {
                Text("7월 31일 아침 식사 기준")
                    .foregroundStyle(.placeholderGray)
                    .font(.Pretendard.regular(.size14).font)
                Spacer()
            }
        }
    }
}

#Preview {
    UserSexFilterView(userSex: .constant(.male))
}
