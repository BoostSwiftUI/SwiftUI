## SwiftUI Concepts Tutorials

[공식문서](https://developer.apple.com/tutorials/swiftui-concepts/exploring-the-structure-of-a-swiftui-app)

### 기록할만한 것들

- 앱 진입점을 @main으로 나타냄
	- @main은 하나만 존재 가능
- App 프로토콜은 앱의 내용과 동작을 제공
	- App 프로토콜은 계산 프로퍼티인 body를 반환
	- body는 Scene 반환
- Scene은 앱의 UI를 정의하는 뷰 계층구조를 가짐
	- SwiftUI는 WindowGroup, Window, DocumentGroup, Settings 등의 다양한 Scene 지원
	- WindowGroup은 플랫폼에 따라 다른 동작을 한다. macOS와 iPadOS에서는 그룹 안에서 하나 이상의 window를 open할 수 있다. 
- 뷰 계층구조

    <img width="182" alt="Screenshot 2024-06-27 at 2 14 03 PM" src="https://github.com/junbok97/SwiftUI/assets/22342277/fcada05c-ac3b-4d1b-8652-9fcf1ffbbd91">

- VStack은 스크린에 보이거나 보이지 않는 뷰들을 모두 동시에 렌더링한다. 
	- 따라서 VStack은 작은 숫자의 subview들만을 가질 때 사용하면 좋다.
	- 많은 숫자의 subview들을 표시해야 한다면 LazyVStack을 사용하는 것이 좋다.
		- LazyVStack은 스크린에 표시되는 뷰만 렌더링한다.
		- LazyHStack도 마찬가지
- .padding 모디파이어는 기본값이 플랫폼에 따라 다르다
- SF Symbol은 Image로 호출하지만 텍스트처럼 .font를 통해 크기를 정한다. 
- Image는 기본적으로 asset의 원본 크기로 보여준다. resizable과 scaledtofit 등의 모디파이어를 사용해 크기 조절 가능
- 서버로부터 이미지를 가져온다면 AsyncImage 사용 가능
	- 이미지를 다운로드하는 도중에도 UI를 block하지 않는다
- 텍스트 크기와 비례해 증가하는 커스텀 padding값을 위해 @ScaledMetric 프로퍼티 래퍼를 사용 가능
	- Dynamic Type을 지원할 경우 유용함
- .overlay와 .background 모디파이어를 활용해 뷰의 앞이나 뒤에 다른 뷰를 배치 가능
	- 이 모디파이어들을 활용할 땐 padding 모디파이어의 적용 순서에 신경쓰기
	- 두 모디파이어들의 특징은 content가 해당 모디파이어가 적용되는 뷰에 기반해 크기가 결정된다는 것이다.
- 뷰 구조를 유지하면서 뷰를 숨길 땐 opacity, hidden 사용, 뷰 구조를 변경하면서 뷰 숨길 땐 if문 사용
- 뷰에서는 프로퍼티와 명령형 코드를 분리하는 것이 좋음
	- 테스트 가능성 및 뷰의 가독성이 좋아짐
- 명령형 코드는 함수로 감싸 뷰에서는 최소한으로 하는 것이 선언적 코드를 읽기 좋음
- @State, @StateObject를 쓸 수 없는 경우 커스텀 바인딩을 사용할 수 있음
	- [참고](https://developer.apple.com/tutorials/swiftui-concepts/defining-the-source-of-truth-using-a-custom-binding)
