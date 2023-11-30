//
//  UserChoice.swift
//  RockPaperScissors
//
//  Created by Jin-Mac on 11/29/23.
//

enum SelectionCases: Int {
    case exit
    case scissors
    case rock
    case paper
    case error
    
    init(RPSUserSelect :Int?) {
        switch RPSUserSelect {
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
    
    init(MJBUserSelect :Int?) {
        switch MJBUserSelect {
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


