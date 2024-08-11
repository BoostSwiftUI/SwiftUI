//
//  FrequentlyAteView.swift
//  Pillyze
//
//  Created by 윤동주 on 7/21/24.
//

import SwiftUI
import DotLottie

struct FrequentlyAteView: View {
    
    @Environment(ModelData.self) var modelData
    
    @State var lottieAnimation = DotLottieAnimation(fileName: "addList", 
                                                    config: AnimationConfig(autoplay: true, loop: false))
    @State var currentWorkItem: DispatchWorkItem?
    
    @Binding var selectedFoods: [RankingFood]
    @Binding var isLottieAnimationShown: Bool
    @Binding var userSex: UserSex
    
    var body: some View {
        ZStack {
            VStack {
                UserSexFilterView(userSex: $userSex)
                ScrollView {
                    ForEach(Array(modelData.rankingFoods.enumerated()),
                            id: \.element.id) { index, food in
                        FoodRankCell(selectedFoods: $selectedFoods,
                                     isLottieAnimationShown: $isLottieAnimationShown,
                                     food: food,
                                     index: index + 1)
                        Divider()
                    }
                }
                .scrollIndicators(.hidden)
            }
            if isLottieAnimationShown {
                lottieAnimation
                    .view()
                    .frame(width: 100, height: 100)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
                    .onTapGesture {
                        self.isLottieAnimationShown = false
                    }
            }
        }
        .onChange(of: selectedFoods) { oldValue, newValue in
            if oldValue.count < newValue.count {
                _ = lottieAnimation.stop()
                _ = lottieAnimation.play()
                let lottieTime = DispatchTimeInterval.milliseconds(Int(lottieAnimation.duration() * 1000))
                currentWorkItem?.cancel()
                
                currentWorkItem =  DispatchWorkItem {
                    isLottieAnimationShown = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + lottieTime, execute: currentWorkItem!)
            }
        }
        
    }
}

#Preview {
    FrequentlyAteView(selectedFoods: .constant([RankingFood(name: "a",
                                                           unit: "b",
                                                           calory: 100,
                                                           rank: 2, 
                                                           rankChange: -2)]),
                      isLottieAnimationShown: .constant(false),
                      userSex: .constant(.male))
}
