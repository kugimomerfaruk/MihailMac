//
//  ViewController.swift
//  FocusCountDown
//
//  Created by ST1 on 3.10.2017.
//  Copyright © 2017 Kugim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var second : Int = 0
    var timer = Timer()
    
    @IBOutlet weak var circleViewContainer: UIImageView!
    @IBOutlet weak var countDownLabel: UILabel!
    
    
    @IBOutlet weak var progressBarOutlet: UIProgressView!
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBOutlet weak var actionViewOutlet: UIView!
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        countDownLabel.text = String(Int(sender.value))
        second = Int(countDownLabel.text!)!
        print(second)
        print(stepperOutlet.value)
        progressBarOutlet.progress = 1
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Ekrana Dokundun")
        view.backgroundColor = UIColor(displayP3Red: 249/255.0, green: 150/255.0, blue: 123/255.0, alpha: 1)
        actionViewOutlet.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.timerFunc)), userInfo: nil, repeats: true)
        circleViewContainer.isHidden = false
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Elini Çektin")
        timer.invalidate()
        actionViewOutlet.isHidden = false
        view.backgroundColor = UIColor(colorLiteralRed: 236/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1)
        circleViewContainer.isHidden = true
        stepperOutlet.value = Double(countDownLabel.text!)!
        
        
    }
    
    func timerFunc() {
        //print("Çalışıyor")
        
        if second <= 0 {
            timer.invalidate()
            second = 0
            //print("Harika Tamamladınız")
            view.backgroundColor = UIColor.white
            actionViewOutlet.isHidden = false
            stepperOutlet.value = 0
            return
            //timer Durdur
        } else {
            second -= 1
            countDownLabel.text! = String(second)
            let artir = (1 / stepperOutlet.value)
            //print(artir)
            //print(second)
            progressBarOutlet.progress -= Float(artir)
            progressBarOutlet.progressTintColor = UIColor.white
            progressBarOutlet.backgroundColor = UIColor.clear
            
        }
    }
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        countDownLabel.text = String(second)
        view.backgroundColor = UIColor(colorLiteralRed: 235/255.0, green: 239/255.0, blue: 243/255.0, alpha: 1)
        circleViewContainer.isHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

