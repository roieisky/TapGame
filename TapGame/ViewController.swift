//
//  ViewController.swift
//  TapGame
//
//  Created by iseki on 2018/04/19.
//  Copyright © 2018年 iseki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerUpdate), userInfo: nil, repeats: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var countTap = 0
    var countNum = 3
    
    var timer : Timer!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var num: UILabel!
    
    
    @IBAction func tapAction(_ sender: UIButton) {
        countTap += 1
        
        if(countTap == 10){
            //画面遷移
            
        }
        
    }
    @objc func timerUpdate() {
        num.alpha = 0.0
        UIView.animate(withDuration: 2.0, delay: 1.0, options: [.curveEaseIn], animations: {
            self.num.alpha = 1.0
        }, completion: nil)
        
    }
    
    

}

