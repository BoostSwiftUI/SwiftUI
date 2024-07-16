//
//  HomeView.swift
//  PillyzeClone
//
//  Created by Mason Kim on 7/16/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedDate: Date = .now

    var body: some View {
        VStack(spacing: 0) {
            NavigationBar()
                .padding(.vertical, 8)
                // .background(.primaryNormal)

            ScrollView {
                VStack(spacing: 0) {
                    weeklyDatePicker

                    content
                }
            }
            // .background(.primaryNormal)
        }
        .background {
            VStack(spacing: .zero) {
                backgroundColors.top        // 상단 배경색
                backgroundColors.bottom     // 하단 배경색
            }
            .ignoresSafeArea()
        }

    }
}

// MARK: - Inner Views

private extension HomeView {
    var weeklyDatePicker: some View {
        WeeklyDatePicker(
            selectedDate: $selectedDate,
            startRangeDate: .now.beforeDate(dayBefore: 100),
            endRangeDate: .now
        )
        .padding(.bottom, 16)
        .background(.primaryNormal)
    }

    var content: some View {
        VStack(spacing: 16) {
            checkScoreView

            Text("Hello World")
                .frame(height: 500)
                .ignoresSafeArea()
        }
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: 24,
                topTrailingRadius: 24
            )
        )
        .frame(maxHeight: .infinity)
        .background(backgroundColors.bottom)
    }

    var checkScoreView: some View {
        VStack(spacing: 0) {
            Text("오늘 내 식사,\n몇 점 짜리 식단일까?")
                .multilineTextAlignment(.center)
                .font(.pretendard(.bold, size: 20))

            Image(.myHealthScore)

            Text("잘 먹어야 건강해요")
                .foregroundStyle(.primaryNormal)
                .padding(.vertical, 10)

            Button("내 식단 점수 확인하기") {

            }
            .buttonStyle(.cta)
        }
        .padding(20)
        .background(.white)
        .clipShape(.rect(cornerRadius: 24))
        .shadow(color: .primaryNormal.opacity(0.1), radius: 16)
        .overlay(alignment: .topTrailing) {
            Button {

            } label: {
                Image(.icClose)
            }
            .padding(16)
        }
        .padding(20)
    }
}

fileprivate struct NavigationBar: View {
    var body: some View {
        HStack {
            Image(.logo)
                .resizable()
                .frame(width: 88, height: 23)

            Spacer()

            HStack(spacing: 8) {
                Button {

                } label: {
                    Image(.icHeaderCalendar)
                }

                Button {

                } label: {
                    Image(.icHeaderAlarm)
                }
                
                Button {

                } label: {
                    Image(.icHeaderUser)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}


// MARK: - Inner Properties

private extension HomeView {
    var backgroundColors: (top: Color, bottom: Color) {
        (.primaryNormal, Color(red: 248, green: 247, blue: 252))
    }
}

// MARK: - Preview

#Preview {
    HomeView()
}
