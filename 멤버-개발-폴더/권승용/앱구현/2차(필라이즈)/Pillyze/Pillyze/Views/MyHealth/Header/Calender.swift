//
//  Calender.swift
//  Pillyze
//
//  Created by 권승용 on 7/13/24.
//

import SwiftUI

    struct Calender: View {
    let days = ["월", "화", "수", "목", "금", "토", "일"]
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Spacer()
                ForEach(0..<days.count, id: \.self) { index in
                    Text(days[index])
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .foregroundStyle(.white)
                        .opacity(0.5)
                    Spacer()
                }
            }
            
            HStack {
                Spacer()
                ForEach(0..<days.count, id: \.self) { index in
                    Text("\(index)")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                    Spacer()
                }
            }
        }
        .padding(.vertical, 4)
        .background {
            Color(.appPrimary)
        }
    }
}

#Preview {
    Calender()
}
