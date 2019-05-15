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

