//
//  ViewController.swift
//  video-everything-macos
//
//  Created by Alex Dodge on 2021-06-28.
//

import Cocoa
import AVKit
import AVFoundation

class ViewController: NSViewController {

    @IBOutlet weak var playerView: AVPlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: "http://localhost:9000/sol-levante/master.m3u8") else {
           return
        }

        // Create a new AVPlayer and associate it with the player view
        let player = AVPlayer(url: url)
        playerView.player = player
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

