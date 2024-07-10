//
//  Price.swift
//  Coupang
//
//  Created by 권승용 on 7/8/24.
//

import SwiftUI

struct Price: View {
    let discountRate: Int
    let price: Int
    let rocketDelivery: Bool
    let rocketWow: Bool
    let showRocketDelivery: Bool
    
    init(discountRate: Int, price: Int, rocketDelivery: Bool, rocketWow: Bool, showRocketDelivery: Bool = true) {
        self.discountRate = discountRate
        self.price = price
        self.rocketDelivery = rocketDelivery
        self.rocketWow = rocketWow
        self.showRocketDelivery = showRocketDelivery
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if discountRate > 0 {
                HStack {
                    Text("\(discountRate)%")
                    Text("\(price)원")
                        .strikethrough()
                }
                .font(.body)
                .foregroundStyle(.secondary)
            }
            HStack {
                Text("\(price * (100 - discountRate) / 100)원")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
                    .layoutPriority(1)
                
                if rocketDelivery && showRocketDelivery {
                    Label {
                        Text("로켓배송")
                            .fontWeight(.bold)
                            .lineLimit(1)
                        
                    } icon: {
                        Image(systemName: "truck.box.fill")
                    }
                    .font(.callout)
                    .foregroundStyle(.cyan)
                }
            }
            if rocketWow {
                Label {
                    Text("로켓와우")
                        .fontWeight(.bold)
                } icon: {
                    Image(systemName: "truck.box")
                }
                .font(.callout)
                .foregroundStyle(.indigo)
            }
        }
    }
}

#Preview {
    NavigationStack {
        Price(discountRate: Product.sample.discountRate, price: Product.sample.price, rocketDelivery: Product.sample.rocketDelivery, rocketWow: Product.sample.rocketWow, showRocketDelivery: true)
    }
}
