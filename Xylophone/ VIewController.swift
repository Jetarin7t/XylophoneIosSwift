//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var player: AVAudioPlayer?

    @IBOutlet weak var key1: UIButton!
    @IBOutlet weak var key2: UIButton!
    @IBOutlet weak var key3: UIButton!
    @IBOutlet weak var key4: UIButton!
    @IBOutlet weak var key5: UIButton!
    @IBOutlet weak var key6: UIButton!
    @IBOutlet weak var key7: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        if sender == key1 {
            playNote(note: 1)
        } else if sender == key2 {
            playNote(note: 2)
        } else if sender == key3 {
            playNote(note: 3)
        } else if sender == key4 {
            playNote(note: 4)
        } else if sender == key5 {
            playNote(note: 5)
        } else if sender == key6 {
            playNote(note: 6)
        } else if sender == key7 {
            playNote(note: 7)
        }
    }
    
    func playNote(note: Int) {
        if note == 6 {
            playSound(tag: note)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.playSound(tag: note+1)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    self.playSound(tag: note-5)
                }
            }
        } else if note == 7 {
            playSound(tag: note)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.playSound(tag: note-6)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    self.playSound(tag: note-5)
                }
            }
        } else {
            playSound(tag: note)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.playSound(tag: note+1)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    self.playSound(tag: note+2)
                }
            }
        }
    }
    
    func playSound(tag: Int) {
        let note = "note" + String(tag)
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    

}

