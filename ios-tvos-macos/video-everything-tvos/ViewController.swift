//
//  ViewController.swift
//  video-everything-tvos
//
//  Created by Alex Dodge on 2021-06-28.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    @IBAction func playVideo(_ sender: Any) {
        guard let url = URL(string: "http://localhost:9000/sol-levante/master.m3u8") else {
            return
        }

        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: url)
     
        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player
     
        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

