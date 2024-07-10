//
//  ItemList.swift
//  Week2_Cupang
//
//  Created by MaraMincho on 7/9/24.
//

import SwiftUI

struct ItemListView: View {
  @ObservedObject var viewModel: ItemListViewModel
  @State var isVertical: Bool = true
  init(viewModel: ItemListViewModel) {
    self.viewModel = viewModel
  }

  @ViewBuilder
  func makeImageView(_ urlString: String) -> some View {
    // Image
    AsyncImage(
      url: URL(string: urlString),
        transaction: Transaction(animation: .default),
        content: { phase in
          if let image = phase.image {
            image
              .resizable()
              .scaledToFit()
          }
          else {
            ProgressView()
          }
        }
    )
    .id(urlString)
    .frame(maxWidth: 125, maxHeight: 350)
  }

  @ViewBuilder
  func makeHorizontalItem(_ item: ItemModelElement) -> some View {
    VStack(spacing: 0) {
      makeImageView(item.imageURL)
      // Title
      Text(item.productName)
        .multilineTextAlignment(.leading)
        .lineLimit(2)

      // DiscountPrice
      HStack(spacing: 0) {
        Text(item.discountPriceText)
          .foregroundStyle(Color.red)
          .font(.title)
          .lineLimit(1)

        if item.rocketWow {
          Text("로켓 와우")
            .foregroundStyle(Color.blue)
            .opacity(0.8)
        }
      }

      //Star
      HStack {
        makeStarView(rating: item.starRatingWeight)
        Text(item.reviewCountText)
        Spacer()
      }
    }
  }

  @ViewBuilder
  func makeVerticalItem(_ item: ItemModelElement) -> some View {
    HStack(spacing: 0) {
      makeImageView(item.imageURL)

      VStack(alignment: .leading, spacing: 0) {
        // Title
        Text(item.productName)
          .multilineTextAlignment(.leading)
          .lineLimit(2)

        // DiscountRate and Original Price Label
        HStack(spacing: 0) {
          Text(item.discountRateText)
            .foregroundStyle(Color.gray)
            .font(.caption)
          Text(item.originalPriceText)
            .foregroundStyle(Color.gray)
            .font(.caption)
            .overlay {
              Color
                .gray
                .frame(maxWidth: .infinity, maxHeight: 1)
            }

          Spacer()
        }

        // DiscountPrice
        HStack(spacing: 0) {
          Text(item.discountPriceText)
            .foregroundStyle(Color.red)
            .font(.title)

          if item.rocketDelivery {
            Text("로켓 배송")
              .foregroundStyle(Color.blue)
              .opacity(0.8)
          }
        }
        
        // Rocket Wow
        HStack(spacing: 0) {
          Text("로켓 와우")
            .foregroundStyle(Color.blue)
        }
        
        HStack {
          //Star
          makeStarView(rating: item.starRatingWeight)
          Text(item.reviewCountText)
          Spacer()
        }

      }
      .frame(maxWidth: .infinity)
    }
    .frame(maxHeight: 750)
  }



  @ViewBuilder
  func makeStarView(rating: Double) -> some View {
    GeometryReader { proxy in
      let starWidth: CGFloat = 20
      let totalWidth = starWidth * 5
      let ratingWidth = totalWidth * CGFloat(rating / 5)

      ZStack(alignment: .leading) {
        HStack(spacing: 0) {
          ForEach(0..<5, id: \.self) { _ in
            Image(systemName: "star.fill")
              .resizable()
              .frame(width: starWidth, height: starWidth)
              .foregroundColor(.gray)
          }
        }

        HStack(spacing: 0) {
          ForEach(0..<5, id: \.self) { _ in
            Image(systemName: "star.fill")
              .resizable()
              .frame(width: starWidth, height: starWidth)
              .foregroundColor(.yellow)
          }
        }
        .frame(width: ratingWidth, alignment: .leading)
        .clipped()
      }
      .frame(width: totalWidth, height: starWidth, alignment: .leading)
    }
    .frame(width: 110, height: 20)
  }

  @ViewBuilder func makeContentView() -> some View {
    VStack(spacing: 0) {
      Text("선물하기 BEST 20")
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
      Toggle(isOn: $isVertical) { }

      Divider()

      if isVertical {
        makeVerticalView()
      }else {
        makeVerticalAndGirdView()
      }

    }
  }

  @ViewBuilder
  func makeVerticalAndGirdView() -> some View {
    ScrollView(.vertical) {
      LazyVGrid(columns: [.init(), .init()]) {
        ForEach(0..<viewModel.itemList.count, id: \.self) { ind in
          let item = viewModel.itemList[ind]
          makeHorizontalItem(item)
            .onTapGesture {
              viewModel.send(.tappedItem)
            }
        }
      }
    }
  }

  @ViewBuilder 
  func makeVerticalView() -> some View {
    ScrollView(.vertical) {
      LazyVStack {
        ForEach(0..<viewModel.itemList.count, id: \.self) { ind in
          let item = viewModel.itemList[ind]
          makeVerticalItem(item)
            .onTapGesture {
              viewModel.send(.tappedItem)
            }
        }
      }
    }
  }


  var body: some View {
    makeContentView()
      .navigationTitle("로켓 선물하기")
      .onAppear{
        viewModel.send(.onAppear)
      }
  }
}

