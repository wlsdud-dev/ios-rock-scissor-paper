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
    case 2:
    case 3:
    case 0:
    default :
        print("종료합니다")
        break
    }
}

