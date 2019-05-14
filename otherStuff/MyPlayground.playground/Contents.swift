import UIKit

enum player {
    case cross, ring
}

var moves = 0

let winCombinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3, 5, 7]]

var currentPlayer = player.cross //later you make it random

func nextPlayer() {
    switch currentPlayer {
    case .cross:
        currentPlayer = .ring
    case .ring:
        currentPlayer = .cross
    }
}

func PlaceObject() {
    if currentPlayer == .cross {
        // place cross
        moves += 1
        nextPlayer()
    } else {
        // place ring
        moves += 1
        nextPlayer()
    }
}

func restart() {
    moves = 0
    //hide all objects
}

func drawCheck() {
    if moves == 9 {
        print("draw")
        // show restart button
    }
}




