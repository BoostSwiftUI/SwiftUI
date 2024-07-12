//
//  PillyzeTabBar.swift
//  pillyze
//
//  Created by 홍승현 on 7/13/24.
//

import SwiftUI

struct PillyzeTabBar: View {
  @Binding var index: Int
  
  var body: some View {
    HStack(spacing: 115) {
      Button {
        
      } label: {
        TabBarItem(title: "내 건강", image: Image(systemName: "heart.fill"))
      }
      
      Button {
        
      } label: {
        TabBarItem(title: "영양제", image: Image(systemName: "pill.fill"))
      }
    }
    .frame(width: .infinity)
  }
}

struct TabBarItem: View {
  let title: String
  let image: Image
  var body: some View {
    VStack(spacing: 8) {
      image
      Text(title)
    }
    .frame(width: 60)
  }
}



#Preview {
  PillyzeTabBar(index: .constant(0))
}
