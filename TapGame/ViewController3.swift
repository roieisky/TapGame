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
    
    var textSec = "99"
    var textMSec = "99"
    var sec = 9999
    
    //ForKey定義
    let label2ArrayForKey:String = "label2Key"
    let label4ArrayForKey:String = "label4Key"
    let secArrayForKey:String = "secKey"
    
    // 配列定義
    var label2Array:Array<String> = []
    var label4Array:Array<String> = []
    var secArray:Array<Int> = []
    
    var label2label4:[[String]] = []
    
    //let originalPasteboard: UIPasteboard = UIPasteboard(name: UIPasteboardName(rawValue: "bestTime1"), create: true)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //保存してある配列の取得
        label2Array = readlabel2Array()
        label4Array = readlabel4Array()
        secArray = readSecArray()
        
        resultSecond.text = textSec
        resultMSec.text = textMSec
        let strTime = textSec + "." + textMSec
        
        if(sec < 200){meritText.text = "神"}
        else if (sec < 300){meritText.text = "プロ"}
        else if (sec < 400){meritText.text = "若い！"}
        else if (sec < 600){meritText.text = "平凡..."}
        else if (sec < 900){meritText.text = "中年"}
        else if (sec < 1500){meritText.text = "老人"}
        else{meritText.text = "遅い..."}
        
        //取得した配列要素とタイムを比較して挿入
        let f = DateFormatter()
        f.timeStyle = .none
        f.dateStyle = .medium
        f.locale = Locale(identifier: "ja_JP")
        let now = Date()
        let strDate = f.string(from: now)
        
        for i in 0 ... 9 {
            if secArray[i] > sec {
                label2Array.removeLast()
                label4Array.removeLast()
                secArray.removeLast()
                label2Array.insert(strTime, at: i)
                label4Array.insert(strDate, at: i)
                secArray.insert(sec, at: i)
                break
            }
        }
            //配列を保存する。
            saveArray(result: label2Array)
            saveArray(result: label4Array)
            saveArray(result: secArray)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // 保存する
    func saveArray(result: Array<Any>) {
        let defaults = UserDefaults.standard
        defaults.set(label2Array, forKey:label2ArrayForKey)
        defaults.set(label4Array, forKey:label4ArrayForKey)
        defaults.set(secArray, forKey:secArrayForKey)
        defaults.synchronize()
    }
    // label2Array取得する
    func readlabel2Array() -> Array<String>  {
        let defaults = UserDefaults.standard
        if let aaa:Array = (defaults.object(forKey: label2ArrayForKey) as? Array<String>)
        {
            return aaa
        }
        else
        {
            return Array(repeating: "?", count: 10)
        }
    }
    // label4Array取得する
    func readlabel4Array() -> Array<String>  {
        let defaults = UserDefaults.standard
        if let aaa:Array = (defaults.object(forKey: label4ArrayForKey) as? Array<String>)
        {
            return aaa
        }
        else
        {
            return Array(repeating: "?", count: 10)
        }
    }
    //secArray取得
    func readSecArray() -> Array<Int>  {
        let defaults = UserDefaults.standard
        if let aaa:Array<Int> = (defaults.object(forKey: secArrayForKey) as? Array<Int>)
        {
            return aaa
        }
        else
        {
            return Array(repeating: 9999, count: 10)
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


