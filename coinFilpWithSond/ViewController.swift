//
//  ViewController.swift
//  coinFilpWithSond
//
//  Created by sebashtian rodriguez on 9/27/22.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var coinFlipSound: AVAudioPlayer?
    var countHeads = 0
    var counteils = 0
    
    @IBOutlet weak var imageArea: UIImageView!
    @IBOutlet weak var labelHeads: UILabel!
    @IBOutlet weak var labelTails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       playASound()
    }

    @IBAction func flipTapped(_ sender: UIButton) {
        playASound()
        flipTheCoin()
    }
    func playASound(){
        let path = Bundle.main.path(forResource: "coinFlip", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            coinFlipSound = try AVAudioPlayer(contentsOf: url)
            coinFlipSound?.play()
        } catch {
            print("sound did not load")
        }
    }
    
    func flipTheCoin(){
        let flip = Bool.random()
        print(flip)
        if flip == true {
            imageArea.image = UIImage(named: "coinHeads")
            countHeads += 1
            labelHeads.text = "\(countHeads)"
        }else {
                imageArea.image = UIImage(named: "coinTails")
            counteils += 1
            labelTails.text = "\(counteils)"

        }
    }
    
}

