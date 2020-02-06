//
//  ViewController.swift
//  StopWatch
//
//  Created by Ramya Seshagiri on 04/02/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK : Way 2
    let watch = Stopwatch()
    
    // MARK :- Way 1
    var timer = Timer()
//    var counter = 0.0
    var isStarted = false
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerOutlet: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
       watch.start()
        pauseButton.isEnabled = false
        
        //        timerOutlet.text = String(counter)
        
    }
    
 
    
    @IBAction func startAction(_ sender: UIButton) {
        
        isStarted = true
        watch.start()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        sender.isEnabled = false
        pauseButton.isEnabled = true
        
    }
    
    @IBAction func pauseAction(_ sender: UIButton) {
        
//        watch.stop()
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
    
        isStarted = false
        
        
//
        
    }
    @IBAction func resetAction(_ sender: UIButton) {
        timerOutlet.text = "00:00:00"
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        watch.stop()
        isStarted = false
        
    }
    
    //WAY 1
    @objc func UpdateTimer(){
     
        //counter+=0.1
        //timerOutlet.text = String(counter)
        
        let min = Int(watch.elapsedTime/60)
        let sec = Int(watch.elapsedTime.truncatingRemainder(dividingBy: 60))
        let tenOfSeconds = Int((watch.elapsedTime*10).truncatingRemainder(dividingBy: 10))
        timerOutlet.text = String(format: "%02d:%02d:%02d", min,sec,tenOfSeconds)

    }
    
    //WAY 2
//    @objc func updateTimerLabel(timer:Timer){
//
//        if watch.isRunning{
//            let min = Int(watch.elapsedTime/60)
//            let sec = Int(watch.elapsedTime.truncatingRemainder(dividingBy: 60))
//            let tenOfSeconds = Int((watch.elapsedTime*10).truncatingRemainder(dividingBy: 10))
//
//            timerOutlet.text = String(format: "%02d:%02d.%d", min,sec,tenOfSeconds)
//
//        }
//        else{
//            timer.invalidate()
//        }
//
//
//    }
    
}

