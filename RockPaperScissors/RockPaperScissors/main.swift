//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

enum UserChoice: Int, CaseIterable {
    case exit = 0
    case scissors = 1
    case rock = 2
    case paper = 3
}
enum Messages: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
    case gameOver = "게임 종료"
    case start = "가위(1) 바위(2) 보(3)! <종료 : 0> :"
    case error = "잘못된 입력입니다. 다시 시도해주세요."
}
func requestMyHand() -> Int? {
    print(Messages.start.rawValue, terminator: " ")
    guard let myHandInput = readLine(), let myHandChoice = Int(myHandInput), (UserChoice.exit.rawValue...UserChoice.paper.rawValue).contains(myHandChoice) else {
        return nil
    }
    if myHandChoice == UserChoice.exit.rawValue {
        return UserChoice.exit.rawValue
    }
    return myHandChoice
}
func requestComHand() -> Int? {
    guard let comHandChoice = UserChoice.allCases.randomElement()?.rawValue else { return nil }
    return comHandChoice
}
func judgment() -> Messages{
    guard let myHand = requestMyHand() else {
        print(Messages.error.rawValue)
        return Messages.error
    }
    let comHand = requestComHand()

    if myHand == UserChoice.exit.rawValue {
        print(Messages.gameOver.rawValue)
        return Messages.gameOver
    } else if (myHand == UserChoice.scissors.rawValue && comHand == UserChoice.paper.rawValue) ||
              (myHand == UserChoice.rock.rawValue && comHand == UserChoice.scissors.rawValue)  ||
              (myHand == UserChoice.paper.rawValue && comHand == UserChoice.rock.rawValue) {
        print(Messages.win.rawValue)
        print(Messages.gameOver.rawValue)
        return Messages.win
    } else if myHand == comHand {
        print(Messages.draw.rawValue)
        return Messages.draw
    } else {
        print(Messages.lose.rawValue)
        print(Messages.gameOver.rawValue)
        return Messages.lose
    }
}
while true {
    let resultValue = judgment()
    if resultValue == Messages.gameOver {
        break
    } else if resultValue == Messages.win {
        break
    } else if resultValue == Messages.lose {
        break
    } else if resultValue == Messages.draw {
        continue
    } else {
        continue
    }
}
