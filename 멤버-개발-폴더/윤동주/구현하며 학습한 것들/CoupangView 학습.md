# CoupangView

## 1. $0가 추론되는 주체가 무엇인지 확인하기

```
LazyVGrid(columns: columns, content: {
                    ForEach(products, id: \.id) {
                            if isListMode {
                                NavigationLink {
                                    ProductDetailView(product: $0)
                                } label: {
                                    ProductListView(product: $0)
                                }

                            } else {
                                NavigationLink {
                                    ProductDetailView(product: $0)
                                } label: {
                                    ProductGridView(product: $0)
                                }
                            }
                        }
                })
```
이렇게 구현하면 문제가 생긴다.
```
Contextual closure type '() -> ProductDetailView' expects 0 arguments, but 1 was used in closure body

Contextual closure type '() -> ProductListView' expects 0 arguments, but 1 was used in closure body
```
이런 오류들이 생기는데 그 이유는 $0의 참조 주체가 ForEach여야 하는데 NavigationLink로 잡혔기 때문...
```
struct NavigationLink<Label, Destination> where Label : View, Destination : View
```
이렇게 NavigationLink도 암시적으로 매개변수 구현이 가능한데 그걸 놓치는 순간 에러를 마주할 수 있다.

```
LazyVGrid(columns: columns, content: {
    ForEach(products, id: \.id) { product in
            if isListMode {
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    ProductListView(product: product)
                }

            } else {
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    ProductGridView(product: product)
                }
            }
        }
})
```
이렇게 구현하면 문제가 해결되는데,
늘 ForEach 구문을 습관적으로 $0으로 쓰지말고,
복수의 매개변수 사용에서(명확한 구분 목적으로), 다중 클로저 사용에서(에러 방지 목적으로) 명시적 매개변수를 고려해야 한다.

## 2. AsyncImage 크기 조절
SwiftUI에서 AsyncImage 크기를 조절하는 방법은...
-> 클로저를 활용하면 된다.

```
AsyncImage(url: URL(string: product.imageUrl)!){
                result in
                result.image?
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            .aspectRatio(contentMode: .fit)
```
클로저의 result로 뽑아낸 매개변수의 image를 resizable 처리하면 frame 적용이 수월해진다.

## 3. CodingKey 구현 시 id 구현의 생략 + Preview에 대한 Data 설정

Data에 id가 포함되지 않은 경우 CodingKey를 설정한 후 UUID로 넣어주면 된다.
다음과 같이.

```
//
//  Product.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/8/24.
//

import Foundation

struct Product: Hashable, Codable {
    let id = UUID()
    let productName: String
    let categories: [String]
    let imageUrl: String
    let price: Int
    let discountRate: Int
    let rocketDelivery: Bool
    let rocketWow: Bool
    let rating: Double
    let reviewCount: Int
    let sellerName: String
    
    var discountedPrice: Int {
        price * (100-(discountRate)) / 100
    }
    
    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case categories
        case imageUrl = "image_url"
        case price
        case discountRate = "discount_rate"
        case rocketDelivery = "rocket_delivery"
        case rocketWow = "rocket_wow"
        case rating
        case reviewCount = "review_count"
        case sellerName = "seller_name"
    }
    static let previewData = Product(productName: "GoPro Hero 10 Black",
                                     categories: ["Technology", "Sports"],
                                     imageUrl: "https://loremflickr.com/300/300/Technology",
                                     price: 599000,
                                     discountRate: 15,
                                     rocketDelivery: true,
                                     rocketWow: true,
                                     rating: 4.7,
                                     reviewCount: 610,
                                     sellerName: "GoPro Official Store")
}

```
만약 CodingKeys를 구현하지 않고서 적용 시엔, 
```
Immutable property will not be decoded because it is declared with an initial value which cannot be overwritten
```
라는 Warning 문구가 뜨는데
Codable 프로토콜을 준수하는 구조체에 대해 id가 초기화되어 있어서 디코딩이 불가능하기 때문이다.

이를 해결하기 위해선 
1. 상단과 같이 id를 CodingKeys에서 제외하는 방법
2. id 선언과 동시에 초기화를 하지 말고, init에서 UUID()로 초기화해주는 방법

을 활용하면 된다.

```
static let previewData = Product(productName: "GoPro Hero 10 Black",
                                     categories: ["Technology", "Sports"],
                                     imageUrl: "https://loremflickr.com/300/300/Technology",
                                     price: 599000,
                                     discountRate: 15,
                                     rocketDelivery: true,
                                     rocketWow: true,
                                     rating: 4.7,
                                     reviewCount: 610,
                                     sellerName: "GoPro Official Store")
```
또한, 이런 식으로 Preview Data를 static으로 선언해두면 이후 View들에서 Preview의 데이터로 사용하기에 좋다

## 4. Localization 적용하기

Localizable.xcstrings파일을 만들고 ko 쪽에 구현해주면 자동으로 locale에 따라 달라진다.

```
@main
struct CoupangViewPracticeApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environment(modelData)
                    .environment(\.locale, .init(identifier: "ko"))
            }
        }
    }
}
```
이런 식으로 
```
.environment(\.locale, .init(identifier: "ko"))
```
environment를 최상단에 주입해주면 하단의 모든 곳에서 locale이 적용된다.

사용 시엔
```
Text(LocalizedStringKey(category.name))
```
이렇게 **LocalizedStringKey**를 사용해서 선언해주면 String 상수가 아닌 변수를 가지고도 Locale 적용이 가능하다.

## 스크린샷
<img src="https://github.com/user-attachments/assets/95cae0c3-dcb6-4a3d-9fe5-7a54a49954de" width="300", alt="Coupang View 스크린샷"/>
