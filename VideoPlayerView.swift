//
//  VideoPlayerView.swift
//  TourzSwift
//
//  Created by Cynthia Whitlatch on 10/16/16.
//  Copyright © 2016 Cynthia Sinclair. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

extension videoPlayerView: UIImagePickerControllerDelegate {
    }
extension videoPlayerView: UINavigationControllerDelegate {
    }

class videoPlayerView: UIViewController {
 
    private var firstAppear = true
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if firstAppear {
            do {
                try playVideo()
                firstAppear = false
            } catch AppError.InvalidResource(let name, let type) {
                debugPrint("Could not find resource \(name).\(type)")
            } catch {
                debugPrint("Generic error")
            }
            
        }
    }

    func playAudio() {
    // set URL of the sound
        let soundURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "chime_bell_ding", ofType: "wav")!)
    
        do
            {
            audioPlayer = try AVAudioPlayer(contentsOfURL: soundURL)
            audioPlayer!.delegate = self
        
            // check if audioPlayer is prepared to play audio
            if (audioPlayer!.prepareToPlay()) {
                audioPlayer!.play()
            }
        }
            catch { }
    
        }
    
    func getVideos() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .savedPhotosAlbum
        imagePickerController.mediaTypes = [kUTTypeMovie as String]
        imagePickerController.delegate = self
        
        self.present(imagePickerController, animated: true, completion: nil)
        }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.dismiss(animated: true, completion: nil)
        
        let videoPlayerViewController = self.storyboard!.instantiateViewControllerWithIdentifier("VideoPlayerViewController") as! VideoPlayerViewController
        videoPlayerViewController.videoURL = info[UIImagePickerControllerMediaURL] as? NSURL
        
        self.navigationController!.pushViewController(videoPlayerViewController, animated: true)
        }
    
    func loadVideo() {
        videoPlayerView = AVPlayer(URL: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = videoPlayerView
        
        NotificationCenter.defaultCenter().addObserver(self, selector: "playerDidReachEndNotificationHandler:", name: AVPlayerItemDidPlayToEndTimeNotification, object: videoPlayerView!.currentItem)
        
        self.presentViewController(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
}

enum AppError : ErrorType {
    case InvalidResource(String, String)
}







//var AVPlayer *player;
//
//func layerClass {
//    return [AVPlayerLayer class];
//}
//
//func (AVPlayer*)player {
//    return [(AVPlayerLayer *)[self layer] player];
//    }
//    
//    - (void)setPlayer:(AVPlayer *)player {
//        [(AVPlayerLayer *)[self layer] setPlayer:player];
//}


