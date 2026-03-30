//
//  ToursDetailViewController.swift
//  Project2
//
//  Created by Bassir, Adrian on 3/27/26.
//

import UIKit
import SnapKit
import AVKit
import AVFoundation

// AVKit and AVFoundation
// https://developer.apple.com/documentation/avkit
// https://developer.apple.com/documentation/avfoundation

class ToursDetailViewController: UIViewController {
    
    var tour: Tour?
    var audioPlayer: AVAudioPlayer?
    
    let playButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = tour?.title
        
        view.addSubview(playButton)
        
        playButton.setTitle("Play Tour", for: .normal)
        
        playButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        playButton.addTarget(self, action: #selector(playTour), for: .touchUpInside)
        
    }
    
    @objc
    func playTour() {
        if tour?.isVideo == true {
            if let path = Bundle.main.path(forResource: tour?.fileName, ofType: "mp4") { // Using AVKit for loading video
                // In-app video playback through AVPlayerViewController
                let player = AVPlayer(url: URL(fileURLWithPath: path))
                let playerVC = AVPlayerViewController()
                
                playerVC.player = player
                
                present(playerVC, animated: true) {
                    player.play()
                }
            }
        } else {
            if let path = Bundle.main.path(forResource: tour?.fileName, ofType: "mp3") { // Using AVFoundation for loading audio
                do {
                    // Audio player (stored as class property above for persistance)
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    audioPlayer?.play()
                } catch {
                    print("Audio failed")
                }
            }
        }
    }
    
}

