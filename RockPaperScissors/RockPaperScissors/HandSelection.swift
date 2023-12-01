

struct HandSelection {
    
    static func getUserInput() -> SelectionCases {
        let userSelect: String = readLine() ??  String(SelectionCases.error.rawValue)
        let selectedNum: Int? = Int(userSelect)
        if GameMode.gameMode == .RPS {
            return SelectionCases(RPSUserSelect: selectedNum)
        } else {
            return SelectionCases(MJBUserSelect: selectedNum)
        }
    }
    
    static func computerHandSelect() -> SelectionCases {
        let handCasesArray:[SelectionCases] = [.scissors, .rock, .paper]
        guard let computerSelect = handCasesArray.randomElement() else { return .error}
        return computerSelect
    }
}
