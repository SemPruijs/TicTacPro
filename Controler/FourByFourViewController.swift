//
//  viewControlerFourByFourViewController.swift
//  Tic tac toe
//
//  Created by Sem Pruijs on 07/06/2019.
//  Copyright © 2019 Sem Pruijs. All rights reserved.
//

import UIKit
import AVFoundation

class FourByFourViewController: UIViewController {

    
     var song = AVAudioPlayer()
    @IBOutlet weak var hasWonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        board = emtyBoardFour()
        for button in buttons {
            button.setImage(nil, for: UIControl.State.normal)
        }
        do {
            song = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: songs.randomItem() , ofType: "m4a")!))
            song.prepareToPlay()
        } catch {
            print(error)
        }
    }
    
    func printPlayerHasWon() {
        if playerHasWon() == Player.cross {
            hasWonLabel.text = "X has won!"
        } else if playerHasWon() == Player.ring {
            hasWonLabel.text = "O has won!"
        } else {
            hasWonLabel.text = ""
        }
    }
    
    @IBAction func music(_ sender: Any) {
        song.play()
    }
    @IBAction func home(_ sender: Any) {
        song.stop()
        board = emtyBoardFour()
    }
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func buttons(_ sender: UIButton) {
        let imageName = whoIs == .ring ? "ring.png" : "cross.png"
        let row = sender.tag / 4
        let column = sender.tag % 4
        
        if playerHasWon() == nil {
            if board[row][column] == nil {
                sender.setImage(UIImage(named: imageName), for: UIControl.State.normal)
                printCircelOrCross(row: row, column: column)
                renderBoard()
                printWinner()
                printPlayerHasWon()
            }
        }
        
        
        if draw() {
            
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        board = emptyBoardThree()
        renderBoard()
        hasWonLabel.text = ""
        for button in buttons {
            button.setImage(nil, for: UIControl.State.normal)
        }
    }
    
    

}
