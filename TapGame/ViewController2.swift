//
//  ViewController2.swift
//  TapGame
//
//  Created by iseki on 2018/04/19.
//  Copyright © 2018年 iseki. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var num: UILabel!

    var countNum = 3
    var countTap = 10
    // タイマー
    var timer : Timer!
    
    let conWidth = UIScreen.main.bounds.size.width
    let conHeight = UIScreen.main.bounds.size.height

    override func viewDidLoad() {
        super.viewDidLoad()
        // カウントダウンタイマー作成
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController2.onUpdate(timer:)), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapAction(_ sender: UIButton) {
        countTap -= 1
        if(countTap == 0)
        {
            tapBtn.isHidden = true
            //画面遷移
        }
        else
        {
            tapBtn.frame.origin = randPoint()
            tapBtn.setTitle(String(countTap), for: .normal)
        }
    }
    @objc func onUpdate(timer : Timer){
        
        // カウントの値1増加
        countNum -= 1
        
        if(countNum == 0){
            timer.invalidate()
            num.isHidden = true
            tapBtn.frame.origin = randPoint()
            tapBtn.isHidden = false
            //計測タイマー作成
        }
        else{
            // 桁数を指定して文字列を作る
            let str = String(countNum)
            // ラベルに表示
            num.text = str
        }
    }
    
    
    
    
    //tapBtn.frame.origin = randPoint()
    func randPoint() -> CGPoint{
        let randWidth  = CGFloat(arc4random_uniform(UInt32(conWidth)-80))
        let randHeight = CGFloat(arc4random_uniform(UInt32(conHeight)-80))
        let randPoint  = CGPoint(x:randWidth,y:randHeight)
        
        return randPoint
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
