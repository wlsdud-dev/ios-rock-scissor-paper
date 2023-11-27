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
enum Massages: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
    case gameOver = "게임 종료"
    case start = "가위(1) 바위(2) 보(3)! <종료 : 0> :"
    case error = "잘못된 입력입니다. 다시 시도해주세요."
}
func requestMyHand() -> Int? {
    print("\(Massages.start.rawValue)", terminator: " ")
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
func judgment() -> Massages{
    guard let myHand = requestMyHand() else {
        print(Massages.error.rawValue)
        return Massages.error
    }
    let comHand = requestComHand()

    if myHand == UserChoice.exit.rawValue {
        print(Massages.gameOver.rawValue)
        return Massages.gameOver
    } else if (myHand == UserChoice.scissors.rawValue && comHand == UserChoice.paper.rawValue) ||
              (myHand == UserChoice.rock.rawValue && comHand == UserChoice.scissors.rawValue)  ||
              (myHand == UserChoice.paper.rawValue && comHand == UserChoice.rock.rawValue) {
        print(Massages.win.rawValue)
        print(Massages.gameOver.rawValue)
        return Massages.win
    } else if myHand == comHand {
        print(Massages.draw.rawValue)
        return Massages.draw
    } else {
        print(Massages.lose.rawValue)
        print(Massages.gameOver.rawValue)
        return Massages.lose
    }
}
