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

typealias Tile = Player?
typealias Board = [[Tile]]

var board: Board = [
    [nil, nil, nil],
    [nil, nil, nil],
    [nil, nil, nil]
]

var whoIs: Player {
    // Only 4 Pros: return board.flatMap { $0 }.compactMap { $0 }.count % 2 == 0 ? .ring : .cross

    var numberOfMoves = 0
    
    for row in board {
        for column in row {
            if column != nil {
                numberOfMoves += 1
            }
        }
    }
    
    return numberOfMoves % 2 == 0 ? .ring : .cross
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
    if board[row][column] == nil && whoIs == .cross {
        placeAt(row: row, column: column, player: .cross)
    } else if board[row][column] == nil && whoIs == .ring {
        placeAt(row: row, column: column, player: .ring)
    } else {
    }
}

func reset() {
    for rowNumber in 0..<board.count {
        for columnNumber in 0..<board[rowNumber].count {
            placeAt(row: rowNumber, column: columnNumber, player: nil)
        }
    }
}




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
    
    var picesCount = 0
    
    for rowNumber in 0..<board.count {
        for columnNumber in 0..<board[rowNumber].count {
            if board[rowNumber][columnNumber] != nil {
                picesCount += 1
            }
        }
    }
    
    if picesCount == 9 {
        picesCount = 0
        print("it's draw")
    }
    
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

