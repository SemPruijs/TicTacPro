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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func music(_ sender: Any) {
        song.play()
    }
    @IBAction func home(_ sender: Any) {
        song.stop()
    }
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func buttons(_ sender: UIButton) {
        let imageName = whoIs == .ring ? "ring.png" : "cross.png"

            sender.setImage(UIImage(named: imageName), for: UIControl.State.normal)
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
