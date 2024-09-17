//
//  CaloryChart.swift
//  Pillyze
//
//  Created by 권승용 on 9/1/24.
//

import SwiftUI

struct CaloryChart: View {
    @Environment(ModelData.self) private var modelData
    
    var body: some View {
        VStack(spacing: 19) {
            totalCalory
            caloryChart
        }
        .padding(.horizontal, 20)
        .padding(.top, 24)
        .padding(.bottom, 30)
        .background {
            Color.componentBackground
        }
    }
    
    private var totalCalory: some View {
        HStack(spacing: 0) {
            Text("총 열량")
                .font(.system(size: 18))
                .fontWeight(.bold)
            Spacer()
            HStack(alignment: .firstTextBaseline, spacing: 6) {
                Text("\(modelData.totalCalory)")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                Text("kcal")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
            }
        }
    }
    
    private var caloryChart: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 18) {
                HStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 12, height: 12)
                        .foregroundStyle(.carbohydrate)
                        .padding(.trailing, 4)
                    Text("탄")
                        .fontWeight(.medium)
                        .padding(.trailing, 4)
                    Text("\(modelData.totalCarbohydrateText)g")
                        .fontWeight(.bold)
                        .padding(.trailing, 3)
                    
                    Image(.info)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                HStack(spacing: 4) {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 12, height: 12)
                        .foregroundStyle(.protein)
                    Text("단")
                        .fontWeight(.medium)
                    Text("\(modelData.totalProteinText)g")
                        .fontWeight(.bold)
                }
                HStack(spacing: 4) {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 12, height: 12)
                        .foregroundStyle(.fat)
                    Text("지")
                        .fontWeight(.medium)
                    Text("\(modelData.totalProteinText)g")
                        .fontWeight(.bold)
                }
            }
            .font(.system(size: 14))
            .foregroundStyle(.textSecondary)
            .padding(.vertical, 3.5)
            
            HStack {
                GeometryReader { proxy in
                    HStack(spacing: 0) {
                        Rectangle()
                            .foregroundStyle(.carbohydrate)
                            .frame(width: proxy.size.width * modelData.carbohydrateDecimal)
                            .overlay {
                                HStack(spacing: 0) {
                                    Text("\(modelData.carbohydratePercentage)")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 14))
                                        .fontWeight(.bold)
                                    Text("%")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                .padding(.leading, 8)
                            }
                        Rectangle()
                            .foregroundStyle(.protein)
                            .frame(width: proxy.size.width * modelData.proteinDecimal)
                            .overlay {
                                HStack(spacing: 0) {
                                    Text("\(modelData.proteinPercentage)")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 14))
                                        .fontWeight(.bold)
                                    Text("%")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                .padding(.leading, 8)
                            }
                        Rectangle()
                            .foregroundStyle(.fat)
                            .frame(width: proxy.size.width * modelData.fatDecimal)
                            .overlay {
                                HStack(spacing: 0) {
                                    Text("\(modelData.fatPercentage)")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 14))
                                        .fontWeight(.bold)
                                    Text("%")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                .padding(.leading, 8)
                            }
                    }
                }
            }
            .frame(height: 25)
            .cornerRadius(4)
        }
    }
}

#Preview {
    CaloryChart()
        .environment(ModelData())
}
