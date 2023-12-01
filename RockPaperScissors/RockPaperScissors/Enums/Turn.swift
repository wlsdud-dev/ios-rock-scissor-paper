


enum Turn {
    case myTurn
    case computerTurn
    
    static var currentTurn = Turn.myTurn
    
    func caseToString() -> String {
        switch self {
        case .myTurn:
            return "사용자"
        case .computerTurn:
            return "컴퓨터"
        }
    }
}
