//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

enum Hand: Int, CaseIterable {
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
    guard let myHandInput = readLine(), let myHandChoice = Int(myHandInput), Hand.scissors.rawValue...Hand.paper.rawValue ~= myHandChoice else { return nil }
    return myHandChoice
}
func requestComHand() -> Int? {
    guard let comHandChoice = Hand.allCases.randomElement()?.rawValue else { return nil }
    return comHandChoice
}
