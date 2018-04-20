//
//  ViewController3.swift
//  TapGame
//
//  Created by iseki on 2018/04/19.
//  Copyright © 2018年 iseki. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var resultSecond: UILabel!
    @IBOutlet weak var resultMSec: UILabel!
    
    var textSec:String?
    var textMSec:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultSecond.text = textSec
        resultMSec.text = textMSec
        
        if(textSec?.hasPrefix("0"))!{
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
