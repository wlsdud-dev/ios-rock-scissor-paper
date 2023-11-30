//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//
protocol GamePlayer {
    func gamePlay()
}
struct ScissorsRockPaperWinLoseCalculation {
    static func winLoseCaculation(userSelct: UserSelection, computerSelect: UserSelection) -> Messages? {
        switch (userSelct, computerSelect) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return .win
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            return .lose
        case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
            return .draw
        default:
            return nil
        }
    }
}
struct ScissorsRockPaperGameController {
    func gamaePlay() {
        while true {
            print("\(Messages.scissorsRockPaperStart.text)", terminator: "")
            let userInput = GetUserSelection.getUserInput()
            let select: [UserSelection] = [.scissors, .rock, .paper]
            
            guard let computerSelect = select.randomElement() else { return }
            
            let scissorsRockPaperResult: Messages? = ScissorsRockPaperWinLoseCalculation.winLoseCaculation(userSelct: userInput, computerSelect: computerSelect)
            
            if userInput == .exit { return }
            
            switch scissorsRockPaperResult {
            case .lose:
                print("\(Messages.lose.text)\n\(Messages.gameOver.text)")
                return
            case .win:
                print("\(Messages.win.text)\n\(Messages.gameOver.text)")
                return
            case .draw:
                print("\(Messages.draw.text)")
            default:
                print("\(Messages.error.text)")
            }
        }
    }
}
struct GetUserSelection {
    static func getUserInput() -> UserSelection {
        let userSelect: String = readLine() ?? String(UserSelection.error.rawValue)
        let selectedNum: Int? = Int(userSelect)
        return UserSelection(userSelect: selectedNum)
    }
}
struct MukJjiBbaGameController {
    
}
struct PlayerTurnChange {
    
}

let game = ScissorsRockPaperGameController()
game.gamaePlay()
