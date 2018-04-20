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
    @IBOutlet weak var meritText: UILabel!
    
    var textSec:String?
    var textMSec:String?
    var sec = 99
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultSecond.text = textSec
        resultMSec.text = textMSec
        sec = Int(String(describing: textSec?.suffix(1)))!
        
        if(textSec?.hasPrefix("0"))!{
            if(sec < 2){
                meritText.text = "神"
            }
            else if (sec < 3){
                meritText.text = "プロ"
            }
            else if (sec < 4){
                meritText.text = "若い！"
            }
            else if (sec < 6){
                meritText.text = "平凡..."
            }
            else if (sec < 8){
                meritText.text = "中年"
            }
            else if (sec < 10){
                meritText.text = "老人"
            }
            else{
                meritText.text = "遅い..."
            }
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
