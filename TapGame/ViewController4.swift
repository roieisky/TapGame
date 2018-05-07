//
//  ViewController4.swift
//  TapGame
//
//  Created by iseki on 2018/05/07.
//  Copyright © 2018年 iseki. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ToViewController5") {
            let vc5: ViewController5 = (segue.destination as? ViewController5)!
            // ViewController5の結果設定
            
        }
    }
    
    @IBAction func okBtn(_ sender: UIButton) {
        //画面遷移
        self.performSegue(withIdentifier: "ToViewController5", sender: nil)
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
