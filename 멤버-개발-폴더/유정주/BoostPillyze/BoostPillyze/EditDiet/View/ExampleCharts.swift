//
//  ExampleCharts.swift
//  BoostPillyze
//
//  Created by 유정주 on 8/10/24.
//

import SwiftUI
import Charts

struct MacroNutrient: Identifiable {
    
    let id = UUID()
    let name: String
    let percentage: Double
    let color: Color
}

struct ExampleCharts: View {
    
    @State private var progress1: CGFloat = 0.0 // 애니메이션 진행률
    @State private var progress2: CGFloat = 0.0 // 애니메이션 진행률
    @State private var progress3: CGFloat = 0.0 // 애니메이션 진행률
    
    let percentages: [CGFloat] = [30, 50, 20] // 퍼센트 값들
    let colors: [Color] = [.red, .green, .blue] // 각 퍼센트에 대응하는 색상
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    ForEach(0..<percentages.count, id: \.self) { index in
                        Rectangle()
                            .fill(colors[index])
                            .frame(width: (progress1 / 100) * (percentages[index] / 100) * geometry.size.width)
                    }
                }
                .frame(height: 20)
                .cornerRadius(4)
                .animation(.linear(duration: 1.0), value: progress1) // 2초 동안 애니메이션
            }
            .frame(height: 20)
            .padding()
            .onAppear {
                withAnimation {
                    progress1 = 100 // 애니메이션을 위해 progress를 100으로 설정
                }
            }
        }
        
        VStack {
            ZStack {
                ForEach(0..<percentages.count, id: \.self) { index in
                    Circle()
                        .trim(from: startTrim(for: index), to: endTrim(for: index))
                        .stroke(colors[index], lineWidth: 20)
                        .rotationEffect(.degrees(-90))
                        .animation(.linear(duration: 2.0), value: progress2)
                }
            }
            .frame(width: 200, height: 200)
            .padding()
            .onAppear {
                withAnimation {
                    progress2 = 100 // 애니메이션을 위해 progress를 100으로 설정
                }
            }
        }
        
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(Color.gray.opacity(0.2)) // Background circle
            
            Circle()
                .trim(from: 0.0, to: progress3)
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [.purple, .blue, .purple]), center: .center),
                    style: StrokeStyle(lineWidth: 23, lineCap: .round)
                )
                .foregroundColor(Color.blue) // Progress circle
                .rotationEffect(.degrees(-90)) // Start from the top
                .animation(.easeInOut(duration: 1.5), value: progress3) // Animation
        }
        .frame(width: 200, height: 200)
        .onAppear {
            withAnimation {
                progress3 = CGFloat(100) / CGFloat(100)
            }
        }
    }
    
    // 각 색상 구간의 시작 트림 계산
    func startTrim(for index: Int) -> CGFloat {
        let previousValues = percentages.prefix(index).reduce(0, +)
        return (progress2 / 100) * (previousValues / 100)
    }
    
    // 각 색상 구간의 끝 트림 계산
    func endTrim(for index: Int) -> CGFloat {
        let currentValues = percentages.prefix(index + 1).reduce(0, +)
        return (progress2 / 100) * (currentValues / 100)
    }
}

#Preview {
    ExampleCharts()
}
