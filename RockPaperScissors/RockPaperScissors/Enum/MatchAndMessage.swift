//
//  MatchAndMessage.swift
//  RockPaperScissors
//
//  Created by Jin-Mac on 11/29/23.
//

enum Messages {
    case win
    case lose
    case draw
    case gameOver
    case scissorsRockPaperStart
    case mukJjiBbaStart(String)
    case error
    
    var text: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        case .gameOver:
            return "게임 종료"
        case .scissorsRockPaperStart:
            return "가위(1) 바위(2) 보(3)! <종료 : 0> : "
        case .mukJjiBbaStart(let turnPlayer):
            return "[\(turnPlayer)] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        case .error:
            return "잘못된 입력입니다. 다시 시도해주세요."
        }
    }
}
