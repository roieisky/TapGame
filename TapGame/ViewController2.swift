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
    @IBOutlet weak var timerSecond: UILabel!
    @IBOutlet weak var timerMSec: UILabel!
    
    var countNum = 3
    var countTap = 10
    var nowTime = 9999
    // タイマー
    var timer : Timer!
    var startTime = Date()
    
    let conWidth = UIScreen.main.bounds.size.width
    let conHeight = UIScreen.main.bounds.size.height
    var tapBtnDiameter = 80

    override func viewDidLoad() {
        super.viewDidLoad()
        // カウントダウンタイマー作成
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController2.onUpdate(timer:)), userInfo: nil, repeats: true)
        
        //ボタン初期設定
        tapBtnDiameter = Int(conWidth / 5)
        tapBtn.frame = CGRect(x: 0, y: 0, width: tapBtnDiameter, height: tapBtnDiameter)
        tapBtn.layer.cornerRadius = CGFloat(tapBtnDiameter / 2)
        
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ToViewController3") {
            let vc3: ViewController3 = (segue.destination as? ViewController3)!
            // ViewController3のタイム設定
            vc3.textSec = timerSecond.text!
            vc3.textMSec = timerMSec.text!
            vc3.sec = nowTime
        }
    }
    //tapBtn押下
    //ボタンをランダムな座標に出現させ、カウントが0になると結果画面に遷移する
    @IBAction func tapAction(_ sender: UIButton) {
        countTap -= 1
        if(countTap == 0)
        {
            stopTimer()
            tapBtn.isHidden = true
            //画面遷移
            self.performSegue(withIdentifier: "ToViewController3", sender: nil)
        }
        else
        {
            tapBtn.frame.origin = randPoint()
            tapBtn.setTitle(String(countTap), for: .normal)
        }
    }
    @objc func onUpdate(timer : Timer){
        
        // カウント-1
        countNum -= 1
        
        if(countNum == 0){
            timer.invalidate()
            num.isHidden = true
            tapBtn.frame.origin = randPoint()
            tapBtn.isHidden = false
            //計測タイマー作成
            startTimer()
        }
        else{
            // 桁数を指定して文字列を作る
            let str = String(countNum)
            // ラベルに表示
            num.text = str
        }
    }
 
    //ランダムな座標を求める
    //tapBtn.frame.origin = randPoint()
    func randPoint() -> CGPoint{
        let randWidth  = CGFloat(arc4random_uniform(UInt32(conWidth) - UInt32(tapBtnDiameter)))
        let randHeight = CGFloat(arc4random_uniform(UInt32(conHeight) - 70 - UInt32(tapBtnDiameter)))
        let randPoint  = CGPoint(x:randWidth,y:randHeight + 70)
        
        return randPoint
    }
    //計測タイマースタート
    @objc func startTimer() {
        if timer != nil{
            // timerが起動中なら一旦破棄する
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(self.timerCounter),
            userInfo: nil,
            repeats: true)
        
        startTime = Date()
    }
    //タイマーストップ
    @objc func stopTimer() {
        if timer != nil{
            timer.invalidate()
        }
    }
    //計算タイマーのリピート処理
    @objc func timerCounter() {
        // タイマー開始からのインターバル時間
        let currentTime = Date().timeIntervalSince(startTime)
        
        // fmod() 余りを計算
        //let minute = (Int)(fmod((currentTime/60), 60))
        // currentTime/60 の余り
        let second = (Int)(fmod(currentTime, 60))
        // floor 切り捨て、小数点以下を取り出して *100
        let msec = (Int)((currentTime - floor(currentTime))*100)

        // %02d： ２桁表示、0で埋める
        //let sMinute = String(format:"%02d", minute)
        let sSecond = String(format:"%02d", second)
        let sMsec = String(format:"%02d", msec)
        
        //時間更新
        timerSecond.text = sSecond
        timerMSec.text = sMsec
        nowTime = (second * 100) + msec
        
        //59秒以上で強制終了
        if(nowTime >= 5900){
            stopTimer()
            tapBtn.isHidden = true
            //画面遷移
            self.performSegue(withIdentifier: "ToViewController3", sender: nil)
        }
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
