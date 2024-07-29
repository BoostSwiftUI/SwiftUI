//
//  RecordView.swift
//  Pillyze
//
//  Created by 윤동주 on 7/16/24.
//

import SwiftUI
import DotLottie

enum RecordTabMenu: String, CaseIterable {
    case frequentlyAte = "자주 드셨어요"
    case favorite = "즐겨찾기"
    case directRegister = "직접 등록"
    
    var categoryTitle: String {
        return self.rawValue
    }
    var selectedTab: Int {
        switch self {
        case .frequentlyAte:
            return 0
        case .favorite:
            return 1
        case .directRegister:
            return 2
        }
    }
}

enum FilteringMenu: String, CaseIterable {
    case all = "전체"
    case food = "음식"
    case set = "세트"
    case popular = "인기"
}

enum UserSex: String, CaseIterable {
    case male = "남성"
    case female = "여성"
}

struct RecordView: View {
    
    @Environment(ModelData.self) var modelData
    
    @State private var searchQueryString = ""
    @State private var selectionTab: Int = RecordTabMenu.frequentlyAte.selectedTab
    @State private var filterElement: FilteringMenu = .all
    @State private var userSex: UserSex = .male
    
    @Binding var isRecordSheetShown: Bool
    
    var body: some View {
        VStack {
            SearchNavigatorView(isRecordSheetShown: $isRecordSheetShown)
                .padding(20)
            
            SlidingTabView(selection: $selectionTab,
                           tabs: RecordTabMenu.allCases.map { $0.categoryTitle })
            
            TabView(selection: $selectionTab) {
                ForEach(RecordTabMenu.allCases, id: \.self) { menu in
                    VStack {
                        HStack(spacing: 10) {
                            ForEach(FilteringMenu.allCases, id: \.self) { filter in
                                ChipButton(element: filter, selectedFilter: filterElement, setFilter: {
                                    setFilter(element: filter)
                                })
                            }
                            Spacer()
                        }
                        Spacer()
                            .frame(height: 23)
                        UserSexFilterView(userSex: $userSex)
                        
                        ScrollView {
                            ForEach(Array(modelData.rankingFoods.enumerated()),
                                    id: \.element.id) { index, food in
                                FoodRankCell(food: food, index: index + 1)
                                Divider()
                            }
                        }
                        .scrollIndicators(.hidden)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .tag(menu.selectedTab)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .onChange(of: selectionTab) { oldValue, newValue in
                self.selectionTab = newValue
            }
            RecordButtonView()
        }
        
    }
    
    
    private func setFilter(element: FilteringMenu) {
        self.filterElement = element
    }
}

#Preview {
    RecordView(isRecordSheetShown: .constant(false))
        .environment(ModelData())
}
