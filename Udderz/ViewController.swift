//
//  ViewController.swift
//  Udderz
//
//  Created by Asim Burrell on 1/28/21.
//

import AVFoundation
import UIKit



class ViewController: UIViewController {

    var player: AVAudioPlayer?

    @IBAction func playSound(_ sender: Any) {
        play()
    }
        
        func play() {
            guard let url = Bundle.main.url(forResource: "invalid_keypress", withExtension: "mp3") else { return }

            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                /* iOS 10 and earlier require the following line:
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

                guard let player = player else { return }

                player.play()

            } catch let error {
                print(error.localizedDescription)
            }
        }
    }



