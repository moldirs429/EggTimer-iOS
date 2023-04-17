//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 8,]
    var timer = Timer()
    var player: AVAudioPlayer!
    
    var totalTime = 0
    var secondsPast = 0
    
    @IBAction func stopSoundBtn(_ sender: UIButton) {
        player.stop()
    }
    
    @IBAction func HardnessSelected(_ sender: UIButton) {
        
        timer.invalidate ()
        let hardness = sender.currentTitle!
       totalTime = eggTimes [hardness]!
        
        progressBar.progress = 0.0
        secondsPast = 0
        titleLabel.text = hardness
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
        @objc func updateTimer() {
            if secondsPast < totalTime {
                secondsPast += 1
                progressBar.progress = Float(secondsPast) / Float(totalTime)
                print(Float(secondsPast) / Float(totalTime))
            }
            else {
                timer.invalidate()
                titleLabel.text = "Done!"
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
            }
        }
        
}
    
