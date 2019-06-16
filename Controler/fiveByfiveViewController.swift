//
//  fiveByfiveViewController.swift
//  Tic tac toe
//
//  Created by Sem Pruijs on 15/06/2019.
//  Copyright © 2019 Sem Pruijs. All rights reserved.
//

import UIKit
import AVFoundation

class fiveByfiveViewController: UIViewController {

    
    var song = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        board = emtyBoardFive()
        for button in buttons {
            button.setImage(nil, for: UIControl.State.normal)
        }
        if let bundle = Bundle.main.path(forResource: songs.randomItem(),  ofType: "m4a") {
            do {
                song = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: bundle))
                song.prepareToPlay()
            } catch {
                print(error)
            }
        } else {
            print("file not found")
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
    
    
    @IBAction func home(_ sender: Any) {
        song.stop()
    }
    
    @IBAction func music(_ sender: Any) {
        if let bundle = Bundle.main.path(forResource: songs.randomItem(),  ofType: "m4a") {
            do {
                song = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: bundle))
                song.prepareToPlay()
            } catch {
                print(error)
            }
        } else {
            print("file not found")
        }
        song.play()
    }
    @IBOutlet weak var hasWonLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func reset(_ sender: Any) {
        board = emtyBoardFive()
        renderBoard()
        hasWonLabel.text = ""
        for button in buttons {
            button.setImage(nil, for: UIControl.State.normal)
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        let row = sender.tag / 5
        let column = sender.tag % 5
        let imageName = whoIs == .ring ? "ring.png" : "cross.png"
        
        if playerHasWon() == nil {
            if board[row][column] == nil {
                sender.setImage(UIImage(named: imageName), for: UIControl.State.normal)
                printCircelOrCross(row: row, column: column)
                renderBoard()
                printPlayerHasWon()
                hasWonLabel.text = printWinner()
    
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
