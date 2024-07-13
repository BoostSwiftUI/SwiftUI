//
//  CategoryView.swift
//  Week2_Cupang
//
//  Created by MaraMincho on 7/9/24.
//

import SwiftUI


struct CategoryView: View {
  @ObservedObject var categoryViewModel: CategoryViewModel
  @State var presents: Bool = false

  init(categoryViewModel: CategoryViewModel) {
    self.categoryViewModel = categoryViewModel
  }

  var body: some View {
    NavigationStack(path: $categoryViewModel.path) {
      makeContentView()
        .padding()
        .navigationDestination(for: NavigationPath.self) { path in
          switch path {
          case .detail:
            Color.blue
          case .itemList:
            ItemListView(viewModel: .init())

          }
        }
    }

  }

  @ViewBuilder func makeContentView() -> some View {
    ScrollView {
      LazyVGrid(columns: [.init(), .init()], spacing: 0) {
        ForEach(0..<categoryViewModel.categories.count, id: \.self) { ind in
          let item = categoryViewModel.categories[ind]
          makeItem(item)
            .onTapGesture {
              categoryViewModel.send(.tappedCategory)
            }
        }
      }
    }
    .onAppear{
      categoryViewModel.send(.onAppear(true))
    }
  }

  @ViewBuilder func makeItem(_ category: Category) -> some View {
    VStack {
      Color.gray.frame(maxWidth: .infinity, maxHeight: 1)

      HStack(alignment: .center, spacing: 0) {
        Text(category.categoryIcon)
          .font(.title)
          .padding(.trailing, 15)
        Text(category.categoryName)
          .font(.title3)
        Spacer()
        Color.gray
          .frame(maxWidth: 1, maxHeight: .infinity)
      }
      Color.gray.frame(maxWidth: .infinity, maxHeight: 1)
    }

  }
}
