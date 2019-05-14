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
        if sender.tag == 0 {
            if whoIs == 0 {
                sender.setImage(UIImage(named: "ring.png"), for: UIControl.State.normal)
                printCircelOrCross(row: 0, column: 0)
                renderBoard()
                nextPlayer()
            } else if whoIs == 1 {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State.normal)
                printCircelOrCross(row: 0, column: 0)
                renderBoard()
                nextPlayer()
            }
            printWinner()
            printPlayerHasWon()
        } else if sender.tag == 1 {
            if whoIs == 0 {
                sender.setImage(UIImage(named: "ring.png"), for: UIControl.State.normal)
                printCircelOrCross(row: 0, column: 0)
                renderBoard()
                nextPlayer()
            } else if whoIs == 1 {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State.normal)
                printCircelOrCross(row: 0, column: 0)
                renderBoard()
                nextPlayer()
            }
            printWinner()
            printPlayerHasWon()
        } else if sender.tag == 2 {
            if whoIs == 0 {
                sender.setImage(UIImage(named: "ring.png"), for: UIControl.State.normal)
                printCircelOrCross(row: 0, column: 0)
                renderBoard()
                nextPlayer()
            } else if whoIs == 1 {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State.normal)
                printCircelOrCross(row: 0, column: 0)
                renderBoard()
                nextPlayer()
            }
            printWinner()
            printPlayerHasWon()
        } else if sender.tag == 3 {
            if whoIs == 0 {
                sender.setImage(UIImage(named: "ring.png"), for: UIControl.State.normal)
                printCircelOrCross(row: 1, column: 0)
                nextPlayer()
                renderBoard()
            } else if whoIs == 1 {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State.normal)
                nextPlayer()
                printCircelOrCross(row: 1, column: 0)
                renderBoard()
            }
            printWinner()
            printPlayerHasWon()
        } else if sender.tag == 4 {
            if whoIs == 0 {
                sender.setImage(UIImage(named: "ring.png"), for: UIControl.State.normal)
                printCircelOrCross(row: 1, column: 1)
                nextPlayer()
                renderBoard()
            } else if whoIs == 1 {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State.normal)
                nextPlayer()
                printCircelOrCross(row: 1, column: 1)
                renderBoard()
            }
            printWinner()
            printPlayerHasWon()
        } else if sender.tag == 5 {
            if whoIs == 0 {
                sender.setImage(UIImage(named: "ring.png"), for: UIControl.State.normal)
                printCircelOrCross(row: 1, column: 2)
                nextPlayer()
                renderBoard()
            } else if whoIs == 1 {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State.normal)
                nextPlayer()
                printCircelOrCross(row: 1, column: 2)
                renderBoard()
            }
            printWinner()
            printPlayerHasWon()
        } else if sender.tag == 6 {
            if whoIs == 0 {
                sender.setImage(UIImage(named: "ring.png"), for: UIControl.State.normal)
                printCircelOrCross(row: 2, column: 0)
                nextPlayer()
                renderBoard()
            } else if whoIs == 1 {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State.normal)
                nextPlayer()
                printCircelOrCross(row: 2, column: 0)
                renderBoard()
            }
            printWinner()
            printPlayerHasWon()
        } else if sender.tag == 7 {
            if whoIs == 0 {
                sender.setImage(UIImage(named: "ring.png"), for: UIControl.State.normal)
                printCircelOrCross(row: 2, column: 1)
                nextPlayer()
                renderBoard()
            } else if whoIs == 1 {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State.normal)
                nextPlayer()
                printCircelOrCross(row: 2, column: 1)
                renderBoard()
            }
            printWinner()
            printPlayerHasWon()
        } else if sender.tag == 8 {
            if whoIs == 0 {
                sender.setImage(UIImage(named: "ring.png"), for: UIControl.State.normal)
                printCircelOrCross(row: 2, column: 2)
                nextPlayer()
                renderBoard()
            } else if whoIs == 1 {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State.normal)
                nextPlayer()
                printCircelOrCross(row: 2, column: 2)
                renderBoard()
            }
            printWinner()
            printPlayerHasWon()
        } 
    }
    
  
    
    @IBAction func Reset(_ sender: Any) {
        reset()
    }
    
//    if whoIs == 0 {
//    sender.setImage(UIImage(named: "ring.png"), for: UIControl.State.normal)
//    printCircelOrCross(row: 0, column: 1)
//    nextPlayer()
//    renderBoard()
//    } else if whoIs == 1 {
//    sender.setImage(UIImage(named: "cross.png"), for: UIControl.State.normal)
//    nextPlayer()
//    printCircelOrCross(row: 0, column: 1)
//    renderBoard()
//    }
//    printWinner()
//    printPlayerHasWon()
    
}


