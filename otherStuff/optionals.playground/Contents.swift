import UIKit

enum Player {
    case cross, ring
}



// notation 1: Array<T>
// notation 2: [T]

// notation 1: Optional<T>
// notation 2: T?

typealias Tile = Player?
typealias Board = [[Tile]]

var board: Board = [
    [nil, nil, nil],
    [nil, nil, nil],
    [nil, nil, nil]
]


func render(tile: Tile) -> String {
    if let player = tile {
        switch player {
        case .ring:
            return "o"
        case.cross:
            return "x"
        }
    }
    return "-"
}


func renderBoard() {
    for row in board {
        for tile in row {
            print(render(tile: tile), terminator: " ")
        }
        print()
    }
}

func placeAt(row: Int, column: Int, player: Player?) {
    board[row][column] = player
    
}

placeAt(row: 0, column: 0, player: .cross)
renderBoard()

func reset() {
    for rowNumber in 0..<board.count {
        for columnNumber in 0..<board[rowNumber].count {
            placeAt(row: rowNumber, column: columnNumber, player: nil)
        }
    }
}

reset()
renderBoard()


func playerHasWon() -> Player?{
    for player in [Player.cross, Player.ring] {
        //horizantal cross check
        for rowNumber in 0..<board.count {
            if board[rowNumber][0] == player && board[rowNumber][1] == player  && board[rowNumber][2] == player {
                return player
            }
        }
        
        //vertical cross check
        for columnNumber in 0...2 {
            if board[0][columnNumber] == player && board[1][columnNumber] == player  && board[2][columnNumber] == player {
                return player
            }
        }
        //diaginal cross check
        if board[0][0] == player && board[1][1] == player  && board[2][2] == player {
            return player
        }
        if board[2][0] == player && board[1][1] == player  && board[0][2] == player {
            return player
        }
    }
    
    return nil
}

playerHasWon()
placeAt(row: 0, column: 0, player: .cross)
placeAt(row: 0, column: 1, player: .cross)
placeAt(row: 0, column: 2, player: .cross)
renderBoard()
playerHasWon()
//let number: Int = 3
//
//var maybeANumber: Int? = nil
//
//maybeANumber = nil
//
//
//if let tile = maybeANumber {
//    //    print(number)
//} else {
//    //    print("maybe a number is not a number")
//}


















