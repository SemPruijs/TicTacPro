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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
