//
//  SlidingTabView.swift
//  Pillyze
//
//  Created by 윤동주 on 7/21/24.
//

import SwiftUI

public struct SlidingTabView : View {
    @Binding var selection: Int
    
    let tabs: [String]
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                ForEach(self.tabs, id:\.self) { tab in
                    Button {
                        withAnimation {
                            let selection = self.tabs.firstIndex(of: tab) ?? 0
                            self.selection = selection
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text(tab)
                                .font(.Pretendard.bold(.size18).font)
                            Spacer()
                        }
                    }
                    .padding(.vertical, 16)
                    .tint(.black)
                }
            }
            GeometryReader { geometry in
                ZStack(alignment: .bottomLeading) {
                    Rectangle()
                        .fill(.placeholderGray)
                        .frame(width: geometry.size.width,
                               height: 1,
                               alignment: .leading)
                    Rectangle()
                        .fill(.primaryPurple)
                        .frame(width: self.tabWidth(from: geometry.size.width),
                               height: 2,
                               alignment: .leading)
                        .offset(x: self.selectionBarXOffset(from: geometry.size.width),
                                y: 0)
                        .animation(.bouncy, value: selection)
                }
            }
            .frame(height: 2)
        }
    }
    
    
    private func isSelected(tabIdentifier: String) -> Bool {
        return tabs[selection] == tabIdentifier
    }
    
    private func selectionBarXOffset(from totalWidth: CGFloat) -> CGFloat {
        return self.tabWidth(from: totalWidth) * CGFloat(selection)
    }
    
    private func tabWidth(from totalWidth: CGFloat) -> CGFloat {
        return totalWidth / CGFloat(tabs.count)
    }
}
