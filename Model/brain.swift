//
//  brain.swift
//  Tic tac toe
//
//  Created by Sem Pruijs on 05/05/2019.
//  Copyright © 2019 Sem Pruijs. All rights reserved.
//

import Foundation


enum Player {
    case cross, ring
}

let numberOfTilesToWin = 3

typealias Tile = Player?
typealias Board = [[Tile]]

var board = emptyBoard()
    
func emptyBoard() -> Board {
        return [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
    ]
}

var whoIs: Player {
    return moveCount % 2 == 0 ? .ring : .cross
}

var numberOfRows: Int { return board.count }
var numberOfColumns: Int { return board[0].count }

// [
//   [
//     (0,0)
//     (0,1)
//     (0,2)
//   ],
//   [
//     (0,0)
//     (1,0)
//     (2,0)
//   ],
// ]


var winningCombinations: [[(Int, Int)]] {
    var result: [[(Int, Int)]] = []

    for rowIndex in 0..<numberOfRows {
        for columnIndex in 0..<numberOfColumns {
            // horizontal right
            if numberOfColumns >= columnIndex + numberOfTilesToWin {
                var winningCombination: [(Int, Int)] = []
                
                for tileIndex in 0..<numberOfTilesToWin {
                    winningCombination.append((rowIndex, columnIndex + tileIndex))
                }

                result.append(winningCombination)
            }
            
            // vertical down
            if numberOfRows >= rowIndex + numberOfTilesToWin {
                var winningCombination: [(Int, Int)] = []
                
                for tileIndex in 0..<numberOfTilesToWin {
                    winningCombination.append((rowIndex + tileIndex, columnIndex))
                }
                
                result.append(winningCombination)
            }

            // diagonal right down
            if numberOfColumns >= columnIndex + numberOfTilesToWin
                && numberOfRows >= rowIndex + numberOfTilesToWin
                {
                var winningCombination: [(Int, Int)] = []
                
                for tileIndex in 0..<numberOfTilesToWin {
                    winningCombination.append((rowIndex + tileIndex, columnIndex + tileIndex))
                }
                
                result.append(winningCombination)
            }

            // diagonal left down
            if columnIndex + 1 >= numberOfTilesToWin
                && numberOfRows >= rowIndex + numberOfTilesToWin
            {
                var winningCombination: [(Int, Int)] = []
                
                for tileIndex in 0..<numberOfTilesToWin {
                    winningCombination.append((rowIndex + tileIndex, columnIndex - tileIndex))
                }
                
                result.append(winningCombination)
            }
        }
    }
    
    
    return result
}

var moveCount: Int {
    // Only 4 Pros: return board.flatMap { $0 }.compactMap { $0 }.count

    var result = 0
    
    for row in board {
        for column in row {
            if column != nil {
                result += 1
            }
        }
    }
    
    return result
}

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

func printCircelOrCross(row: Int, column: Int) {
    if board[row][column] == nil {
        placeAt(row: row, column: column, player: whoIs)
    }
}

func reset() {
    board = emptyBoard()
}

func draw() -> Bool {
    return moveCount == 9 && playerHasWon() == nil
}

func playerHasWon() -> Player?{
//    for player in [Player.cross, Player.ring] {
//        let numberOfRows = board.count
//        let numberOfColumns = board[0].count
//
//        var combinations: [[Tile]] = []
//
//        combinations.append(contentsOf: board)
//
//        for columnIndex in 0..<numberOfColumns {
//            var columnTiles: [Tile] = []
//
//            for rowIndex in 0..<numberOfRows {
//                columnTiles.append(board[rowIndex][columnIndex])
//            }
//
//            combinations.append(columnTiles)
//        }
//
//        print(combinations)
//
//
    
    print("start")
    for winningCombination in winningCombinations {
        let playersOnBoard = winningCombination.map { board[$0][$1] }
        
        for tile in playersOnBoard {
            for player in [Player.cross, Player.ring] {
                if tile == player {
                    
                }
            }
        }
        }
    
  
   
//        123
//        456
//        789
        
//        123
//        456
//        789
//        147
//        258
//        369

//        159
//        357

//        [
//            [ .cross, nil, .cross],
//            [ .ring, .ring, nil],
//            [ .ring, .cross, .cross],
//            [ .cross, nil, .cross],
//            [ .cross, nil, .cross],
//            [ .ring, .ring, nil],
//            [ .cross, .cross, .cross],
//            [ .cross, nil, .cross]
//        ]
//
//        [
//            [ .cross, .cross],
//            [ .ring, .ring],
//            [ .ring, .cross, .cross],
//            [ .cross, .cross],
//            [ .cross, .cross],
//            [ .ring, .ring],
//            [ .cross, .cross, .cross],
//            [ .cross, .cross]
//        ]
//
//        [
//            [ .ring, .cross, .cross],
//            [ .cross, .cross, .cross],
//        ]
//
//        [
//            [ .ring, .cross],
//            [ .cross],
//        ]
//
//        [
//            [ .cross]
//        ]

//        //horizantal cross check
//        for rowNumber in 0..<numberOfRows {
//            if board[0][rowNumber] == player && board[1][rowNumber] == player  && board[2][rowNumber] == player {
//                return player
//            }
//        }
//
//        //vertical cross check
//        for columnNumber in 0..<numberOfColumns {
//            if board[0][columnNumber] == player && board[1][columnNumber] == player  && board[2][columnNumber] == player {
//                return player
//            }
//        }
//        //diaginal cross check
//        if board[0][0] == player && board[1][1] == player  && board[2][2] == player {
//            return player
//        }
//        if board[2][0] == player && board[1][1] == player  && board[0][2] == player {
//            return player
//        }
//
//    }
    return nil
}

func printWinner() {
    let checkWinner = playerHasWon()
    
    if checkWinner == Player.cross {
        print("Cross has won!")
    } else if checkWinner == Player.ring {
        print("Ring has won!")
    } else if checkWinner == nil {
        print()
    }
}

