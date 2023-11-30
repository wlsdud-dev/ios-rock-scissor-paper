

struct WinLoseCalculation {
    static func RPSWinLoseCaculation(userSelect: SelectionCases, computerSelect: SelectionCases) -> Messages? {
        switch (userSelect, computerSelect) {
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
    
    static func MJBWinLoseCalculation(userSelect: SelectionCases, computerSelect: SelectionCases) -> Messages? {
        
        switch Turn.currentTurn {
        case .myTurn:
            switch (userSelect, computerSelect) {
            case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
                return .nextTurn
            case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
                Turn.currentTurn = .computerTurn
                return .changeTurn
            case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
                return .win
            default:
                return nil
                
            }
            
        case .computerTurn:
            switch (userSelect, computerSelect) {
            case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
                Turn.currentTurn = .myTurn
                return .changeTurn
            case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
                return .nextTurn
            case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
                return .lose
            default:
                return nil
            }
        }
        
    }
}
