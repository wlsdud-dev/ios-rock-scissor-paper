

struct ScissorsRockPaperGameController {
    func RPSGamePlay() {
        while GameMode.gameMode == .RPS {
            print("\(Messages.scissorsRockPaperStart.text)", terminator: "")
            
            let userInput = HandSelection.getUserInput()
            let computerSelect = HandSelection.computerHandSelect()
            
            //손패 결정
            
            
            let scissorsRockPaperResult: Messages? = WinLoseCalculation.RPSWinLoseCaculation(userSelect: userInput, computerSelect: computerSelect)
            // 승 패 비김 판별
            
            if userInput == .exit { print("\(Messages.gameOver.text)"); return }
            
            print("컴퓨터 : \(computerSelect)  나 : \(userInput)")              //TODO: 삭제할거
            
            switch scissorsRockPaperResult {
            case .lose:
                print("\(Messages.lose.text)\n\(Messages.gameOver.text)")
                Turn.currentTurn = Turn.computerTurn
                GameMode.gameMode = .MJB
                return
            case .win:
                print("\(Messages.win.text)")
                Turn.currentTurn = Turn.myTurn
                GameMode.gameMode = .MJB
                return
            case .draw:
                print("\(Messages.draw.text)")
            default:
                print("\(Messages.error.text)")
            }
        }
    }
}

struct MJBGameController {
    func MJBGamePlay() {
        while GameMode.gameMode == .MJB {
            print("\(Messages.mukJjiBbaStart.text)", terminator: "")
            
            let userInput = HandSelection.getUserInput()
            let computerSelect = HandSelection.computerHandSelect()
            
            let MJBGameResult: Messages? = WinLoseCalculation.MJBWinLoseCalculation(userSelect: userInput, computerSelect: computerSelect)
            
            if userInput == .exit { print("\(Messages.gameOver.text)"); return }
            
            print("컴퓨터 : \(computerSelect)  나 : \(userInput)")      //TODO: 삭제할거
            
            switch MJBGameResult {
            case .lose:
                print("\(Messages.lose.text)\n\(Messages.gameOver.text)")
                GameMode.gameMode = .RPS
                return
            case .win:
                print("\(Messages.win.text)\n\(Messages.gameOver.text)")
                GameMode.gameMode = .RPS
                return
            case .nextTurn:
                print("\(Messages.nextTurn.text)")
                continue
            case .changeTurn:
                print("\(Messages.changeTurn.text),\(Messages.nextTurn.text)")
                continue
            default:
                print("\(Messages.error.text)")
                break
            }
        }
    }
}
