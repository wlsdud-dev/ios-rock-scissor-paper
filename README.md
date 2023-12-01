# 묵찌빠 프로젝트

### 프로젝트 소개

*[맛있는코드 x 새싹] 동대문 1기 AI활용 iOS 개발자 과정에서 작성한 묵찌빠 프로그램입니다.*

- 팀원 : Jin, easy
- 프로젝트의 주제 : 묵찌빠게임을 커맨드 라인 앱으로 구현하였습니다.

안녕하세요! 두번째 부활한 묵찌빠 프로젝트 입니다.

두번을 처음부터 다시 짜면서 많은 시행착오가 있었지만 객체의 역할과 상호작용의 의미를 조금씩 알아가면서 어색했던 `OOP`와 좀 더 가까워 질 수 있는 좋은 시간이었습니다.

# 🤔고민했던 point

- 기존 코드를 지우고 처음부터
    - 기존 코드의 구조를 가지고 묵찌빠게임 기능을 추가하는 것은 수정과 문제사항에 대한 대응이 오히려 더 어려움이 많아 다시 만들면서 구현을 위해 마주치는 문제들과 OOP, MVC 등을  처음부터 고려하며 경험하고 공부한 내용들을 적용해 보기로 했습니다.

- 객체지향프로그래밍
    - 각 객체와 메서드 들의 역할을 어디까지 제한할 것인지,너무 많은 기능이 들어간것은 아닌지 명료한 코드가 되려면 어떻게 나누어야 할까를 중심으로 생각했습니다
    - 초반에는 객체안의 값들을 활용할 때 인스턴스를 생성해서 상호작용 하는것을 시도해 보았는데 생각처럼 잘 되지 않아 컨트롤러의 메서드를 대부분 타입 메서드로 만들어 사용 했습니다.
    - 타입 메서드/속성 으로 만들시 단점이 무엇인지 궁금합니다
- Naming
    
    조언주신대로 모든 약어를 풀어서 썼습니다. 너무 길어진감이 있긴 하지만, 명료함이 우선임을 계속해서 생각하면서 만들었습니다.
    

---

# 🗂️파일구조

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/c4c734d3-d9db-4362-b929-6f0065471760/d5e4a40c-50b9-4d01-9931-847ee3f64df6/Untitled.png)

어제 배운 MVC 를 나름대로 적용해서 파일을 나누어 봤습니다.

# 💬구조 설명

---

## 🔸main (view)

```swift
**let** RockScissorsPaperGame = RockScissorsPaperGameController()
let MukJjiBbaGame = MukJjiBbaGameController()

RockScissorsPaperGame.playGame()
MukJjiBbaGame.playGame()
```

상위 경로에서 view 역할을 하는 `main`에는 각 게임을 진행하는 인스턴스를 생성해 이어서 실행시켜 주었습니다.

## 🔸Model

```swift
enum SelectionCases: Int {
    case exit
    case scissors
    case rock
    case paper
    case error
    
    init(RockScissorsPaperUserSelect :Int?) {
        switch RockScissorsPaperUserSelect {
        case 1:
            self = .scissors
        case 2:
            self = .rock
        case 3:
            self = .paper
        case 0:
            self = .exit
        default:
            self = .error
        }
    }
    
    init(MukJjiBbaUserSelect :Int?) {
        switch MukJjiBbaUserSelect {
        case 1:
            self = .rock
        case 2:
            self = .scissors
        case 3:
            self = .paper
        case 0:
            self = .exit
        default:
            self = .error
        }
    }
}
```

사용자의 선택에 따른 케이스를 `enum` 케이스로 만들고, 

사용자의 입력값을 정수로 받아 가위바위보와 묵찌빠에 서로 다르게 매칭되는 케이스를 반환하도록 했습니다.

```swift
enum Messages {
    case win
    case lose
    case draw
    case gameOver
    case RockscissorsPaperStart
    case mukJjiBbaStart
    case changeTurn
    case nextTurn
    case error
		
		var text: String {

...}
```

게임 결과에 따른 동작과 메세지 출력을 위한 `enum` 케이스 입니다. `text` 연산속성으로 케이스별 메세지 반환을 구현했습니다.

```swift
enum GameMode {
    case RockScissorsPaper
    case MukJjiBba
    
    static var gameMode = GameMode.RockScissorsPaper
}
```

현재 게임모드를 확인하고 변경하기 위해 만든 `enum` 입니다

```swift
enum Turn {
    case myTurn
    case computerTurn
    
    static var currentTurn = Turn.myTurn
    
    func caseToString() -> String {
        switch self {
        case .myTurn:
            return "사용자"
        case .computerTurn:
            return "컴퓨터"
        }
    }
}
```

묵찌빠 게임 실행시 현재 턴을 확인하고 변경할수 있도록 만든 enum 입니다. 턴 케이스에 따라 누구의 턴인지 알 수 있는 문자열을 반환하는 메서도 포함해 주었습니다.

## 🔸Controller

```swift
protocol GameController {
	func playGame()
}

struct RockScissorsPaperGameController: GameController {...}
struct MukJjiBbaGameController: GameController {...}
```

가위바위보와 묵찌빠 실행 객체를 만들기 위해 공통적인`GameController`프로토콜을 정의 해주었습니다.

```swift
struct HandSelection {
	static func getUserInput() -> SelectionCases {...}
	static func computerHandSelect() -> SelectionCases {...}
}
```

사용자 입력을 받는 객체를 구현하여 `GameController` 의 부담을 줄여 주었습니다.

```swift
struct WinLoseCalculation {
	static func rockScissorsPaperWinLoseCaculation() {...}
	static func mukJjiBbaWinLoseCalculation() {...}
}
```

사용자와 컴퓨터의 승패 판단을 위한 객체 `WinLoseCalculation` 정의 하여 `GameController` 와 상호 작용 할 수 있게 객체를 따로 나누어 구현했습니다.

---

# 순서도

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/c4c734d3-d9db-4362-b929-6f0065471760/387a4875-60b5-45b4-b9bb-e1e3776e123f/Untitled.png)

# 실행결과

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/c4c734d3-d9db-4362-b929-6f0065471760/af7076f6-6265-4a87-814f-9cc014ff27a8/Untitled.png)

턴이 변경되었음을 알려주는 메세지와 각자의 손패가 무엇인지 알려주는 메세지를 추가적으로 넣어주었습니다. 원래는 테스트용으로 만들었는데 간단한 코드라서 제외시키진 않았습니다.

### ****프로젝트 수행 중 핵심 경험 체크리스트****

- [x]  Swift의 Optional 안전하게 처리하기
- [x]  if와 switch 조건문의 차이와 장단점 비교해보기
- [ ]  순환함수(재귀함수)와 반복문의 장단점 비교해보기
    - 재귀함수가 좋지 않다는것을 어렴풋이 인지하고 있어서 자연스럽게 쓰지 않는쪽으로 흘러갔습니다.
- [x]  함수가 한 가지 일만 하도록 기능 분리하기
- [x]  guard 구문의 이해와 활용
- [x]  Git의 커밋단위 고민하고 커밋에 적용하기
- [x]  Git 커밋 로그 형식에 맞춰 커밋하기
- [x]  코딩 컨벤션 고민하기
- [x]  동료와 협업자세 고민하기
