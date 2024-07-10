## Develop in Swift Tutorials

[공식문서](https://developer.apple.com/tutorials/develop-in-swift)

### 기록을 남길만한 점들
- 기본적으로 ideal한 크기를 가지는 뷰가 있고, 그렇지 않은 뷰가 있음
	- ideal한 크기를 가지는 뷰는 해당 크기에 맞게 자동으로 크기가 지정됨
		- ex) VStack은 컨테이너 안의 뷰를 감싸는 크기, Text는 내용물을 감싸는 크기
	- ideal한 크기를 가지지 않는 뷰는 채울 수 있는 공간을 모두 채워버린다
		- ex) SwiftUI의 Shape들 (RoundedRectangle, Circle 등)
- border 사용해서 UI 경계를 확인, 디버깅에 도움을 줄 수 있음
- Gradient 색상은 아래와 같이 작성 가능
```swift
let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]


struct ContentView: View {
    var body: some View {
        TabView {
            WelcomePage()
            FeaturesPage()
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
    }
}
```
- 보통은 SF Symbol 크기를 주변과 일치하도록 .font 모디파이어를 사용해 지정하지만, 순수한 graphical content로서 SF Symbol을 사용하는 경우엔 .resizable과 .frame을 사용해도 좋음
- Image의 aspectRatio 모디파이어의 contentMode .fit은 이미지가 사용 가능한 공간과 같은 aspect ratio를 가지지 못할 경우 더 작은 축으로 줄어들어 비율을 맞춘다는 뜻
- Button은 VoiceOver와 같은 기능 때문에 text가 항상 존재해야 함
	- 이미지만 사용하고 싶을 경우엔 labelStyle 모디파이어에서 .iconOnly를 사용
- .tint 모디파이어는 accent color를 사용하는 뷰에게만 영향을 미친다. 
- 아래와 같이 primary color와 secondary color를 설정해 SF Symbol의 palette rendering mode를 사용 가능하다.
```swift
Image(systemName: "die.face.\(numberOfPips).fill")
	.resizable()
	.frame(maxWidth: 100, maxHeight: 100)
	.aspectRatio(1, contentMode: .fit)
	.foregroundStyle(.black, .white) // <- 앞이 primary, 뒤가 secondary
```
- TextView에 빈 스페이스 값이라도 있어야 화면의 수직 공간을 차지한다. 아무 값도 없으면 다른 뷰가 TextView의 자리를 채워버린다. 
- 삼항 연산자를 뷰 또는 모디파이어 코드에서 사용하는 것은 계산 프로퍼티 등의 방법보다 더 간결하며 가독성이 좋다
- SwiftData는 클래스의 built-in identity를 사용해서 앱 전체에 모델 데이터를 공유한다. 따라서 SwiftData의 @Model 매크로를 준수하려면 클래스여야만 한다.  
- SwiftData의 @Model은 자동으로 identity를 관리하기 때문에 따로 List에서 id를 작성해줄 필요가 없다. 
- .bold()의 내부에 Bool 값을 전달해 적용할지 말지에 대한 조건을 작성 가능
	- ex) .bold(friend.isBirthdayToday)
- List는 NavigationLink가 있으면 chevron(오른 화살표)를 생성한다.
- Group은 내용물을 변경시키지 않는 컨테이너 뷰. 조건문을 감싸거나 모디파이어를 많은 뷰에 한 번에 적용할 때 유용하다. 
- 모든 모델을 context에 삽입한 이후에 relationship을 정의한다. 
- relationship 중 한 endpoint에 값을 설정하면 SwiftData가 자동으로 그에 대응하는 endpoint의 프로퍼티를 업데이트한다. 
	- 따라서 한 쪽 만 설정해 주어도 된다. 
- Picker 동작에는 적절한 tag 설정이 필요함