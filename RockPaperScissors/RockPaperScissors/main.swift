//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

while true {
    print("가위(1) 바위(2) 보(3)! <종료 : 0> :")
    var input = readLine()
    var comChoice = Int.random(in: 1...3)
    
    switch Int(input ?? "a") {
    case 1:
        if comChoice == 1 {
            print("비겼습니다!")
        } else if comChoice == 2 {
            print("졌습니다!")
        }else if comChoice == 3 {
            print("이겼습니다!")
        }
    case 2:
        if comChoice == 2 {
            print("비겼습니다!")
        } else if comChoice == 3 {
            print("졌습니다!")
        }else if comChoice == 1 {
            print("이겼습니다!")
        }
    case 3:
        if comChoice == 3 {
            print("비겼습니다!")
        } else if comChoice == 1 {
            print("졌습니다!")
        }else if comChoice == 2 {
            print("이겼습니다!")
        }
    case 0:
        print("종료합니다")
        break
    default :
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

