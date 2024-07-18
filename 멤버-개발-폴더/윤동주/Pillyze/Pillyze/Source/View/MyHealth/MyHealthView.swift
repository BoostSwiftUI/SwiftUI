//
//  MyHealthView.swift
//  Pillyze
//
//  Created by 윤동주 on 7/16/24.
//

import SwiftUI

struct MyHealthView: View {
    @State private var isAtBottom: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.primaryPurple
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0...30, id: \.self) { day in
                            Button {
                                print("\(Constants.weekDays[day%7]),\(day+1)")
                            } label: {
                                MyHealthCalendarListItem(weekDay: Constants.weekDays[day%7],
                                                         day: day+1,
                                                         isSelected: true)
                            }
                        }
                    }
                    .padding(.top, 47)
                }
                
                VStack {
                    VStack(spacing: 20) {
                        MyHealthSectionStack {
                            VStack(alignment: .center) {
                                HStack {
                                    Spacer()
                                    Text("오늘 내 식사,\n몇 점 짜리 식단일까?")
                                        .multilineTextAlignment(.center)
                                        .font(.Pretendard.bold(.size20).font)
                                    Spacer()
                                }
                                Image("diet")
                                Text("잘 먹어야 건강해요")
                                    .font(.Pretendard.regular(.size14).font)
                                    .foregroundStyle(.primaryPurple)
                                    .padding(.vertical, 10)
                                CustomButton(text: "내 식단 점수 확인하기",
                                             font: .Pretendard.medium(.size18).font,
                                             horizontalPadding: 0,
                                             verticalPadding: 16,
                                             color: .primaryPurple) {
                                    print("내 식단 점수 확인하기 버튼 Clicked")
                                }
                                             .padding(.horizontal, 24)
                            }
                            .padding(.vertical, 20)
                        }
                        
                        
                        MyHealthSectionStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("식단")
                                        .font(.Pretendard.medium(.size14).font)
                                        .foregroundStyle(.secondaryText)
                                    Text("\(0)kcal")
                                        .font(.Pretendard.bold(.size18).font)
                                        .foregroundStyle(.black)
                                    nutritionSet(color: Color(hex: "A286FD"),
                                                 nutrition: "탄",
                                                 percentage: 0)
                                    nutritionSet(color: Color(hex: "6AAEF6"),
                                                 nutrition: "단",
                                                 percentage: 0)
                                    nutritionSet(color: Color(hex: "68E1D8"),
                                                 nutrition: "지",
                                                 percentage: 0)
                                }
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Image("homeSecondSectionCalendar")
                                    Text("오늘 뭐 드셨나요?")
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(.placeholderPurple)
                                        .clipShape(RoundedRectangle(cornerRadius: 99))
                                }
                            }
                            .padding(.vertical, 24)
                            .padding(.horizontal, 14)
                        }
                        Rectangle()
                            .foregroundStyle(.placeholderPurple)
                            .frame(height: 500)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.placeholderPurple)
                .clipShape(.rect(
                    topLeadingRadius: 24,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 24
                ))
                .ignoresSafeArea()
                Divider()
                    .background(.clear)
                    .onAppear {
                        print("Hi")
                    }
            }
            
            ZStack(alignment: .bottom) {
                Color.primaryPurple
                    .opacity(0.7)
                HStack {
                    Image("logo")
                    Spacer()
                    Image("calendar")
                    Image("alarm")
                    Image("user")
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 13)
            }
            .ignoresSafeArea()
            .frame(height: 47)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

@ViewBuilder
func nutritionSet(color: Color, nutrition: String, percentage: Int) -> some View {
    HStack {
        RoundedRectangle(cornerRadius: 4)
            .foregroundStyle(color)
            .frame(width: 12, height: 12)
        Text("\(nutrition) \(percentage)%")
            .font(.Pretendard.medium(.size14).font)
    }
}

#Preview {
    MyHealthView()
}
