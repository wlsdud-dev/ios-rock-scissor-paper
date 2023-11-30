

func requestMyHand() -> Int? {
    guard let myHandInput = readLine(),
          let myHandChoice = Int(myHandInput),
          Hand.exit...Hand.paper ~= myHandChoice else { return nil }
    return myHandChoice
}

func requestComHand() -> Int {
    let comHandChoice = Int.random(in: Hand.scissors...Hand.paper)
    return comHandChoice
}



class RPS_Referee {
    
    //유저 선택 판별
   class func judgmentUserSelection(myHand: Int?, comHand: Int) -> JudgmentResults {
       
        guard let myHand = myHand else { return JudgmentResults.error }
       
        print("\(comHand), \(myHand)")
       
       switch myHand {
       case 0:
           return JudgmentResults.gameOver
       case (comHand % 3) + 1:
           return JudgmentResults.win
       case comHand:
           return JudgmentResults.draw
       default:
           return JudgmentResults.lose
       }
    
    }
}

class MJB_Referee: RPS_Referee {
    override class func judgmentUserSelection (myHand: Int?, comHand: Int) -> JudgmentResults {

        print("\(comHand), \(String(describing: myHand!))")
        
        switch Turn.currentTurn {
        case .myTurn:
            switch myHand {
            case 0:
                print(Messages.gameOver)
                return JudgmentResults.gameOver
            case (comHand % 3) + 1:
                print(Messages.myTurn)
                return JudgmentResults.next
            case comHand:
                print(Messages.win)
                return JudgmentResults.win
            default:
                print(Messages.computerTurn)
                Turn.currentTurn = .computerTurn
                return JudgmentResults.turnChange
            }
            
        case .computerTurn:
            switch myHand {
            case 0:
                print(Messages.gameOver)
                return JudgmentResults.gameOver
            case (comHand % 3) + 1:
                print(Messages.myTurn)
                Turn.currentTurn = .myTurn
                return JudgmentResults.turnChange
            case comHand:
                print(Messages.lose)            //TODO: 방법을 못찾음..
                return JudgmentResults.lose
            default:
                print(Messages.computerTurn)
                return JudgmentResults.next
            }
        }
        
    }
    
}


while true {
    guard GameMode.currnetGameMode == .MJB else {
        print("\(Messages.RPSstart)", terminator: " ")
        
        let myHand = requestMyHand()
        let comHand = requestComHand() //TODO: 전
        
        
    let RPSJudgmentResult = RPS_Referee.judgmentUserSelection(myHand: myHand, comHand: comHand)
        
        if RPSJudgmentResult == JudgmentResults.gameOver {
            print(Messages.gameOver)
            break
        } else if RPSJudgmentResult == JudgmentResults.win {
            print(Messages.win,"게임 변경")
            GameMode.currnetGameMode = .MJB
            continue
        } else if RPSJudgmentResult == JudgmentResults.lose {
            print(Messages.lose, Messages.gameOver)
            break
        } else if RPSJudgmentResult == JudgmentResults.draw {
            print(Messages.draw)
            continue
        } else {
            print(Messages.error)
            continue
        }
    }

    
    

    if Turn.turn == true {
        print("[사용자 턴] \(Messages.MJBstart)", terminator: " ")
    } else if Turn.turn == false {
        print("[컴퓨터 턴] \(Messages.MJBstart)", terminator: " ")
    }
    
    let myHand = requestMyHand()
    let comHand = requestComHand()

    let MJBJudgmentResult = MJB_Referee.judgmentUserSelection(myHand: myHand, comHand: comHand)
    
//    print("\(comHand), \(String(describing: myHand!))")
    
    if MJBJudgmentResult == JudgmentResults.gameOver {
        break
    } else if MJBJudgmentResult == JudgmentResults.win {
        break
    } else if MJBJudgmentResult == JudgmentResults.lose {
        break
    } else if MJBJudgmentResult == JudgmentResults.turnChange {
        Turn.turn.toggle()
        continue
    } else if MJBJudgmentResult == JudgmentResults.next {
        continue
    } else {
        print(Messages.error)
        continue
   
    }

}
