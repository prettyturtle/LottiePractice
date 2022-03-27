# Lottie 사용하기

### 결과
![](https://images.velog.io/images/yc1303/post/fbe6bf8d-c0cb-43b1-8484-417932095654/lottie.gif)

### 1. [Install](https://github.com/airbnb/lottie-ios)

### 2. [Lottie Files](https://lottiefiles.com/)
- 여기서 원하는 로티 애니메이션을 다운 받으면 된다
- 형식을 `Lottie JSON`로 받는다
- 다운 받은 후 Xcode 프로젝트 폴더에 넣어준다
![](https://images.velog.io/images/yc1303/post/0c8af7cc-4627-4679-8461-0f000469523f/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202022-03-27%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%203.34.23.png)

### 3. 애니메이션 시작하기
- `import Lottie`
- 애니메이션 뷰 만들기
``` swift
let animationView = AnimationView(name: "100261-wave")
```
- 애니메이션 뷰 실행하기
``` swift
// 그냥 실행
animationView.play()
// 애니메이션이 종료됐을 시 실행할 동작이 있을 때
animationView.play(completion: )
```
- 애니메이션 반복
``` swift
animationView.loopMode = .loop // 계속 반복
animationView.loopMode = .repeat(3) // 3번 반복
// playOnce..등등 여러가지 있음
```

### 4. 뷰 제거하기
- 직접 제거
``` swift
view.addSubView(animationView) // 뷰에 애니메이션 뷰 삽입

...

animationView.removeFromSuperview() // 애니메이션 뷰를 슈퍼뷰에서 제거
```
- tag를 이용한 제거
  - 아래의 예시를 보면 `setup` 함수에서 선언된 `animationView`는 `disappear` 함수에서 사용할 수 없다
  - 이때 태그를 달아놓으면, 태그로 뷰를 찾아 제거해 줄 수 있다
``` swift
func setup(name: String) {
    let animationView = AnimationView(name: name)
    animationView.tag = 51 // 애니메이션 뷰의 태그 값을 51이라고 설정
    animationView.loopMode = .loop
    addSubView(animationView) // 애니메이션 뷰를 contentView에 삽입
    ...
       animationView.play()
}

func disappear() {
    // 태그로 뷰 찾기
    guard let playingAnimationView = viewWithTag(51) else { return }
    playingAnimationView.removeFromSuperView() // 제거
}
```
