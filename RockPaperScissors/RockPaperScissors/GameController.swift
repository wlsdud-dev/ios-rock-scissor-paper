
protocol GameController {
    func playGame()
}

struct RockScissorsPaperGameController: GameController {
    func playGame() {
        while GameMode.gameMode == .RockScissorsPaper {
            print("\(Messages.RockscissorsPaperStart.text)", terminator: "")
            
            let userInput = HandSelection.getUserInput()
            let computerSelect = HandSelection.computerHandSelect()
            
            
            
            let rockScissorsPaperResult: Messages? = WinLoseCalculation.rockScissorsPaperWinLoseCaculation(userSelect: userInput, computerSelect: computerSelect)
            
            
            if userInput == .exit { print("\(Messages.gameOver.text)"); return }
            
            print("컴퓨터 : \(computerSelect)  나 : \(userInput)")
            
            switch rockScissorsPaperResult {
            case .lose:
                print("\(Messages.lose.text)")
                Turn.currentTurn = Turn.computerTurn
                GameMode.gameMode = .MukJjiBba
                return
            case .win:
                print("\(Messages.win.text)")
                Turn.currentTurn = Turn.myTurn
                GameMode.gameMode = .MukJjiBba
                return
            case .draw:
                print("\(Messages.draw.text)")
            default:
                print("\(Messages.error.text)")
            }
        }
    }
}

struct MukJjiBbaGameController: GameController {
    func playGame() {
        while GameMode.gameMode == .MukJjiBba {
            print("\(Messages.mukJjiBbaStart.text)", terminator: "")
            
            let userInput = HandSelection.getUserInput()
            let computerSelect = HandSelection.computerHandSelect()
            
            
            if userInput == .exit { print("\(Messages.gameOver.text)"); return }
            if userInput == SelectionCases.error { Turn.currentTurn = .computerTurn }
            
            let mukJjiBbaGameResult: Messages? = WinLoseCalculation.mukJjiBbaWinLoseCalculation(userSelect: userInput, computerSelect: computerSelect)
            
            print("컴퓨터 : \(computerSelect)  나 : \(userInput)")
            
            switch mukJjiBbaGameResult {
            case .lose:
                print("\(Messages.lose.text)\n\(Messages.gameOver.text)")
                GameMode.gameMode = .RockScissorsPaper
                return
            case .win:
                print("\(Messages.win.text)\n\(Messages.gameOver.text)")
                GameMode.gameMode = .RockScissorsPaper
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
