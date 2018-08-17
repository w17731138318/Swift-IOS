//
//  ViewController.swift
//  StopWatch
//~~~~~~~
//  Created by 王伟欣 on 2018/8/16.
//  Copyright © 2018年 王伟欣. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    var counter = 0.0
    @IBOutlet weak var resetBtn: UIButton!
    var timer = Timer()
    var isPlaying = false
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(counter)
        
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func resetButtonDidTouch(_ sender: UIButton) {
        timer.invalidate()
        isPlaying = false
        counter = 0
        timeLabel.text = String(counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @IBAction func playButtonDidTouch(_ sender: UIButton) {
        print(isPlaying)
        if(isPlaying) {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseButtonDidTouch(_ sender: UIButton) {
        
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false
        
    }
    
    @objc func UpdateTimer() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
        
    }
    
    
}

