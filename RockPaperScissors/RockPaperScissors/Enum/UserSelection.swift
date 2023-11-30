//
//  UserChoice.swift
//  RockPaperScissors
//
//  Created by Jin-Mac on 11/29/23.
//

enum UserSelection: Int {
    case exit
    case scissors
    case rock
    case paper
    case error
    
    init(userSelect :Int?) {
        switch userSelect {
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
}
