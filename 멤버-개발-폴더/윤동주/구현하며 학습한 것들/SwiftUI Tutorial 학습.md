# SwiftUI Tutorial
## Chapter 1

- Preview 하단의 Live mode -> Selectable mode로 변경 후, Command + Control을 누른 채 Preview를 클릭 시 Embed in Stack, Grouping, modifier 반영 등이 가능함.

- Image 사진명에 배율을 포함 시 'imageName@2x'처럼 써줌.
-> 이렇게 적용 시 해당 배율로 알아서 배치됨. Image 제목에선 @2x는 빠짐.


- .navigationBarTitleDisplayMode는 automatic이 기본
-> inline이나 Large로 할 시 해당 옵션으로 완전 고정됨.

- 전역변수로 작성해도 되지만 @Environment로 환경변수로 사용하는게 좋음.

1. 캡슐화 문제
2. 변수의 의존성 증가
3. 변수의 상태를 추적하기 어려움


그래서 Model 내에서

```
var landmarks: [Landmark] = load("landmarkData.json")
```

대신 다음과 같이 환경변수로 사용하는게 더 선호됨.

```
@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
}
```

- 어떤 배열의 index값은 predicate처럼 filter를 거쳐서 View 내의 state 위치에 선언.

- NavigationSplitView는 iPad 같은 곳에서 사용함.
    - content는 좌측의 List로 들어가지고
    - detail은 우측의 큰 View(내용)를 차지함.


- Map(initialPosition: .region(region)) vs Map(position: .constant(.region(region)))
    - Map(initialPosition: .region(region))
        - 초기 위치를 설정 후 유저가 지도 위치를 자유롭게 이동이 가능
    - Map(position: .constant(.region(region)))
        - 지도의 위치를 픽스하고, 유저가 그 위치를 변경하지 못하도록 함

- border를 overlay로 적용하는 방법
```
image
    .clipShape(Circle())
    .overlay {
        Circle().stroke(.white, lineWidth: 4) // inset, offset 모두 2씩 차지
    }
```

- JSON 파일 load 함수
```
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
```

## Chapter 2

- editMode를 활용해서 기존 구현된 기능들 사용
```
@Environment(\.editMode) var editMode
```

- listRowInsetws로 양 옆 가득 채우기
```
.listRowInsets(EdgeInsets())
```
.padding(0) 대신 이렇게 채우는 방식을 공식 Tutorial에서 사용

- Animation의 순차적 변경 방법
```
extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            // index 순서대로 변경 + transition이 일어남.
            .delay(0.03 * Double(index))
    }
}

...

ForEach(Array(data.enumerated()), id: \.offset) { index, observation in
    GraphCapsule(
        index: index,
        color: color,
        height: proxy.size.height,
        range: observation[keyPath: path],
        overallRange: overallRange
    )
    // 다른 필터링으로 적용 시 스르륵 변하는 효과
    .animation(.ripple(index: index))
}

}
.animation(.ripple(index: index))
```

- transition 추출하여 적용
```
// 이런 식으로 transition을 빼내어서 적용할 수 있음.
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        // 나타날 때와 사라질 때의 transition 효과를 달리 줄 수 있음.
        .asymmetric(
            insertion: .move(edge: .leading).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

...

HikeDetail(hike: hike)
    .transition(.moveAndFade) //나타나는 방식 설정
```

- fit과 fill을 간단하게 사용법 차이
    - fit: 삐져나오는 건 상관없이 최대한 꽉 채워버리기
    - fill: 가장 삐져나오지 않는 선에서 꽉 채우기

```
// 1:1 유지하며 fit은 모두 보여줄 수 있는 비율로 맞춤, fill은 안보이는 부분 관계없이 빈 구석 없게 꽉 채움.
.aspectRatio(1, contentMode: .fit)
```

- renderingMode
: Image를 보여줄 때 default, original, template 모드 중 하나로 보여줄 수 있음.
    - default
    : 각 View or Control마다 default 값이 다름.
    ```
    UIImageView - Original
    UIButton(.system) - Template
    UIButton(.custom) - Original
    UITabBarItem - Template
    UIBarButtonItem - Template
    ```
    - original: 기존의 이미지 그대로 보여줌.
    - template: 불투명한 곳을 masking 처리하고 거기에 색상을 입히거나, 기존 시스템의 색상을 입힐 수 있음.

    - 참고: 
    https://green1229.tistory.com/305
    https://phillip5094.tistory.com/29

- Color.primary : 시스템 모드에 따라...라이트: 검은색 / 다크: 흰색
