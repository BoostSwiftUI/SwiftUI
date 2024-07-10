## SwiftUI Tutorials
[공식문서](https://developer.apple.com/tutorials/swiftui/creating-and-combining-views)

### 새로 알게 된 사실들

- 외부 프레임워크와 SwiftUI를 함께 import하게 된다면, 해당 프레임워크가 제공하는 SwiftUI-specific한 기능들을 사용 가능하다.
- frame 모디파이어에서 height, width 둘 중 하나만 작성하면 뷰 내용의 크기에 맞게 자동으로 나머지 크기가 지정된다. 
- 각각의 preview를 작성할 수도 있고, preview 내에서 Group으로 묶어서 한 번에 같이 볼 수도 있다. 
- 타입이 Identifiable을 준수하면 List에서 사용 시 id 파라미터를 넣어주지 않아도 됨
- 커스텀 뷰가 특정한 뷰를 모디파이어로 감싸기만 하는 패턴은 SwiftUI에서 흔한 패턴이다.
```swift
// 예시
struct CircleImage: View {
    var image: Image


    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}
```
- List에서 정적 뷰와 동적 뷰를 함께 사용하기 위해서는 ForEach를 사용해서 반복되는 데이터를 표현
- Path를 사용해서 선, 곡선 등 drawing primitive들을 조합해 복잡한 Shape을 그릴 수 있다. 
- path의 move(to:) 메소드는 shape의 bound 내부로 그리기 펜을 이동시킨다. 
	- 가상의 펜이 그림 그리기 시작을 기다리는 것 처럼
- Path 그리기 관련해서는 공부를 좀 해야할듯
- move(to:) 를 사용해 동일한 path에 있는 여러 도형 사이에 gap을 삽입할 수 있다.

    <img width="294" alt="Screenshot 2024-07-03 at 11 51 58 AM" src="https://github.com/junbok97/SwiftUI/assets/22342277/60de955d-71f2-4014-9055-30863b5f9e7c">

- 서로 비교 가능한(equatable) 뷰에 .animation(\_:) 모디파이어를 사용하면 뷰의 애니메이션 가능한 프로퍼티에 대한 변경을 SwiftUI가 애니메이션화 한다. 
	- 뷰의 color, opacity, rotation, size 등등의 프로퍼티들!
- 뷰가 비교 가능하지 않다면(not equatable) .animation(\_:value:) 모디파이어를 사용해 특정한 값이 변경되었을 때 애니메이션을 시작하도록 할 수 있다.
- .animation 모디파이어는 감싸고 있는 뷰의 모든 애니메이션 가능한 변경들에게 적용된다. 
- 적절한 시점에 animation(nil)을 사용해 특정한 프로퍼티만 애니메이션을 적용할 수도 있다.
- .animation 모디파이어는 그것이 감싸고 있는 뷰에 애니메이션을 적용하고 싶을 때 사용
- withAnimation을 사용하면 withAnimation 내부에서 변경되는 값이 영향을 미치는 모든 뷰에 애니메이션이 적용된다.
- 기본적으로 뷰 트랜지션은 fade in fade out이 적용된다. `transition(_:)` 모디파이어를 사용해서 이를 변경할 수 있다. 
- AnyTransition의 익스텐션에 새로운 트랜지션을 정의해 코드를 깔끔하게 유지할 수 있다.
- asymmetric(insertion:removal:)을 사용해 뷰가 나타나고 사라질 때 각각 다른 트랜지션을 제공할 수 있다.
- animation을 테스트하고 싶을 땐 duration을 걸어 천천히 실행되도록 한다. 
- .listRowInsets(EdgeInsets())를 사용해 List의 Row Inset을 0으로 만들 수 있다.
- navigation link의 Label로 전달하게 되는 Text는 environment의 accent color를 사용해 렌더링되고, Image는 탬플릿 이미지로 렌더링된다. 따라서 각각의 동작을 원하는 방식으로 동작하도록 모디파이어를 적용해 주어야 한다.
- 상위 뷰가 SoT를 관리하고 하위 뷰에서 SoT에 대한 쓰기가 없다면 @Binding이 아닌 일반 프로퍼티를 사용하면 된다.
- Path로 생성한 그래픽은 accessibilityLabel 모디파이어를 붙여서 접근성을 지원해주는 것이 좋다.
- 뷰 자체에서는 @Environment를 사용하지 않아도 자식 뷰에서 사용한다면 프리뷰에서 environment 모디파이어를 적용해 주어야 한다. 
