//
//  AddDiet.swift
//  Pillyze
//
//  Created by 권승용 on 7/13/24.
//

import SwiftUI
import Lottie

struct AddDiet: View {
    @Environment(ModelData.self) private var modelData
    @Environment(\.dismiss) private var dismiss
    
    @State private var isAddingList: Bool = false
    @State private var playbackMode: LottiePlaybackMode = .paused
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.componentBackground
                    .ignoresSafeArea(edges: .top)
                
                VStack(spacing: 0) {
                    searchBar()
                    CustomTabBar()
                }
                
                VStack(spacing: 0) {
                    Spacer()
                    BottomPicker(isAddingList: $isAddingList)
                        .padding(.bottom, proxy.safeAreaInsets.bottom)
                        .background {
                            Color(.componentBackground)
                        }
                        .animation(.easeInOut, value: isAddingList)
                }
                .ignoresSafeArea()
                
                if isAddingList {
                    LottieView {
                        try await DotLottieFile.named("add-list")
                    }
                    .animationSpeed(2)
                    .playbackMode(playbackMode)
                    .animationDidFinish { completed in
                        playbackMode = .paused
                        modelData.isAdded = false
                        isAddingList = false
                    }
                }
            }
            .onChange(of: modelData.isAdded) { oldValue, newValue in
                if newValue == true {
                    isAddingList = true
                    playbackMode = .playing(.fromProgress(0, toProgress: 1, loopMode: .playOnce))
                }
            }
            .toolbar(.hidden)
        }
    }
    
    @ViewBuilder
    func searchBar() -> some View {
        HStack {
            SearchTextField()
            Button {
               dismiss()
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
    AddDiet()
        .environment(ModelData())
}
