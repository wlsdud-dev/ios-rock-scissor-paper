

enum SelectionCases: Int {
    case exit
    case scissors
    case rock
    case paper
    case error
    
    init(RockScissorsPaperUserSelect :Int?) {
        switch RockScissorsPaperUserSelect {
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
    
    init(MukJjiBbaUserSelect :Int?) {
        switch MukJjiBbaUserSelect {
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


