//
//  ViewController.swift
//  musicHost
//
//  Created by Rishi Masand on 6/24/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    
    var defaultURL:String = "http://darthbatman.tk:8899/"

    @IBOutlet weak var songName: UITextField!
   
    var player = AVPlayer()
    var center = MPNowPlayingInfoCenter.defaultCenter()

    @IBAction func playSong(sender: AnyObject) {
        player.pause()
        var tempName0 = songName.text
        var tempName1 = String(filter(tempName0.generate()) { $0 != " "})
        println(tempName1)
        var tempName2 = tempName1.stringByAppendingString(".mp3")
        var theSongURL = defaultURL.stringByAppendingString(tempName2)
        println(theSongURL)
        
        var playerItem = AVPlayerItem(URL: NSURL(string: theSongURL))
        var metadataList: NSArray = playerItem.asset.commonMetadata
//        println(metadataList[0])
//        for metaItem in metadataList {
//            println(metaItem.commonKey)
//        }
        
        player = AVPlayer(URL: NSURL(string: theSongURL))
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
        center.nowPlayingInfo = [MPMediaItemPropertyTitle : tempName1]
        player.volume = 1.0
        player.rate = 1.0
        player.play()
        
        
    }

}

