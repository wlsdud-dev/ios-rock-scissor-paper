

enum GameMode {
    case RPS
    case MJB
    
    static var currnetGameMode = GameMode.RPS
}

enum Turn {
    case myTurn
    case computerTurn
    
    static var turn = true
    static var currentTurn = Turn.myTurn
}

enum Hand {
    static let exit = 0
    static let scissors = 1
    static let rock = 2
    static let paper = 3
    
//    case scissors_2 = 1
//    case rock_2 = 2
//    case paper_2 = 3
//
//    func transformString () -> String {
//        switch self {
//        case .scissors_2: return "가위"
//        case .rock_2: return "바위"
//        case .paper_2: return "보"
//        }
//    }
}

enum Messages {
    static let win = "이겼습니다!"
    static let lose = "졌습니다!"
    static let draw = "비겼습니다!"
    static let gameOver = "게임 종료"
    static let RPSstart = "가위(1) 바위(2) 보(3)! <종료 : 0> :"
    static let error = "잘못된 입력입니다. 다시 시도해주세요."
    
    static let MJBstart = "찌(1) 묵(2) 빠(3)! <종료 : 0> :"
    static let computerTurn = "컴퓨터의 턴입니다."
    static let myTurn = "사용자의 턴입니다."
    
//    func printMessages () {
//        switch self {
//        case .win: print(Messages.win)
//        case .lose: print(Messages.lose)
//        case .draw: print(Messages.draw)
//        case .gameOver: print(Messages.gameOver)
//        case .start: print(Messages.start)
//        case .error: print(Messages.error)
//        }
//    }
}

enum JudgmentResults {
    
    case win
    case lose
    case draw
    case error
    case gameOver
    
    case turnChange
    case next
}
