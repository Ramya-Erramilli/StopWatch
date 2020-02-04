//
//  ViewController.swift
//  StopWatch
//
//  Created by Ramya Seshagiri on 04/02/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var counter = 0.0
    var isStarted = false
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pauseButton.isEnabled = false
        
        timerOutlet.text = String(counter)
        
    }

    @IBOutlet weak var pauseButton: UIButton!
    @IBAction func startAction(_ sender: UIButton) {
        
        isStarted = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        
        sender.isEnabled = false
        pauseButton.isEnabled = true
        
    }
    
    @IBAction func pauseAction(_ sender: UIButton) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        
        isStarted = false
        
        
    }
    @IBAction func resetAction(_ sender: UIButton) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        timerOutlet.text = "0.0"
        counter = 0.0
        isStarted = false
        
    }
    
    @objc func UpdateTimer(){
    
        counter += 0.1
        timerOutlet.text = String(format: "%.1f", counter)
        
    }
}

