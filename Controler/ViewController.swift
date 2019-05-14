//
//  ViewController.swift
//  Tic tac toe
//
//  Created by Sem Pruijs on 01/05/2019.
//  Copyright © 2019 Sem Pruijs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBOutlet weak var hasWonLabel: UILabel!

    @IBOutlet var buttons: [UIButton]!
    
    func printPlayerHasWon() {
        if playerHasWon() == Player.cross {
            hasWonLabel.text = "X has won!"
        } else if playerHasWon() == Player.ring {
            hasWonLabel.text = "O has won!"
        } else {
            hasWonLabel.text = ""
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        let row = sender.tag / 3
        let column = sender.tag % 3
        let imageName = whoIs == 0 ? "ring.png" : "cross.png"
        
        
        if board[row][column] == nil {
            sender.setImage(UIImage(named: imageName), for: UIControl.State.normal)
            printCircelOrCross(row: row, column: column)
            renderBoard()
            nextPlayer()
            printWinner()
            printPlayerHasWon()
        }
        
    }
    
    @IBAction func Reset(_ sender: Any) {
        reset()
        renderBoard()
        for button in buttons {
            button.setImage(nil, for: UIControl.State.normal)
        }
    }
}


