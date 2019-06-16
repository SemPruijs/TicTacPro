//
//  menuViewController.swift
//  Tic tac toe
//
//  Created by Sem Pruijs on 16/06/2019.
//  Copyright © 2019 Sem Pruijs. All rights reserved.
//

import UIKit
import AVFoundation

class menuViewController: UIViewController {

    var songMenu = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let bundle = Bundle.main.path(forResource: "tic tac pro menu 1" ,  ofType: "m4a") {
            do {
                songMenu = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: bundle))
                songMenu.prepareToPlay()
                songMenu.play()
            } catch {
                print(error)
            }
        } else {
            print("file not found")
        }
    }
    

    @IBAction func play(_ sender: Any) {
        songMenu.stop()
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
