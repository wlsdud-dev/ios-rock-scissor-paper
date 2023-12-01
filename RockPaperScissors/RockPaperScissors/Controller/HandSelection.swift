

struct HandSelection {
    
    static func getUserInput() -> SelectionCases {
        let userSelect: String = readLine() ??  String(SelectionCases.error.rawValue)
        let selectedNum: Int? = Int(userSelect)
        if GameMode.gameMode == .RockScissorsPaper {
            return SelectionCases(RockScissorsPaperUserSelect: selectedNum)
        } else {
            return SelectionCases(MukJjiBbaUserSelect: selectedNum)
        }
    }
    
    static func computerHandSelect() -> SelectionCases {
        let handCasesArray:[SelectionCases] = [.scissors, .rock, .paper]
        guard let computerSelect = handCasesArray.randomElement() else { return .error}
        return computerSelect
    }
}
