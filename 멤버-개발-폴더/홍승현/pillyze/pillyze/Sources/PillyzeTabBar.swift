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
    HStack(spacing: 30) {
      Button {
        
      } label: {
        TabBarItem(title: "내 건강", image: Image(systemName: "heart.fill"))
      }
      
      Button {
        
      } label: {
        Image(systemName: "plus")
          .resizable()
          .frame(width: 24, height: 24)
          .frame(maxWidth: 56, maxHeight: 56)
          .foregroundStyle(.white)
          .background(.pillyzePrimary)
          .clipShape(Circle())
          .offset(y: -8)
      }
      
      Button {
        
      } label: {
        TabBarItem(title: "영양제", image: Image(systemName: "pill.fill"))
      }
    }
    .frame(width: .infinity, height: 60)
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
    .frame(width: 82)
  }
}



#Preview {
  PillyzeTabBar(index: .constant(0))
}
