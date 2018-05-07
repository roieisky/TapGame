//
//  TableViewController.swift
//  TapGame
//
//  Created by iseki on 2018/04/20.
//  Copyright © 2018年 iseki. All rights reserved.
//

import UIKit

class TableViewController: UIViewController ,
UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var table: UITableView!
    
    //ForKey定義
    let label2ArrayForKey:String = "label2Key"
    let label4ArrayForKey:String = "label4Key"
    let secArrayForKey:String = "secKey"
    
    // 配列定義
    var label2Array:Array<String> = []
    var label4Array:Array<String> = []
    var secArray:Array<Int> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //保存してある配列の取得
        label2Array = readlabel2Array()
        label4Array = readlabel4Array()
        secArray = readSecArray()
        
        // Do any additional setup after loading the view.
    }

    //Table Viewのセルの数を指定
    func tableView(_ table: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return label2Array.count
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "bestTime1Cell",
                                             for: indexPath)
        
        //Tagごとに設定
        let label1 = cell.viewWithTag(1) as! UILabel
        label1.text = "No." + String(indexPath.row + 1)
        
        let label2 = cell.viewWithTag(2) as! UILabel
        label2.text = String(describing: label2Array[indexPath.row])
        
        let label3 = cell.viewWithTag(3) as! UILabel
        label3.text = "秒"
        
        let label4 = cell.viewWithTag(4) as! UILabel
        label4.text = String(describing: label4Array[indexPath.row])
        
        return cell
    }
    // Cell の高さを10分割にする
    func tableView(_ table: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return table.bounds.height / 10
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func endFunc() {
        // アプリが終了する時
       
        //配列を保存する。
        saveArray(result: label2Array)
        saveArray(result: label4Array)
        saveArray(result: secArray)
    }

    // 保存する
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
    //reset
    func reset(){
        //初期化
        label2Array = Array(repeating: "?", count: 10)
        label4Array = Array(repeating: "?", count: 10)
        secArray = Array(repeating: 9999, count: 10)
    }
    @IBAction func resetAction(_ sender: UIButton) {
        //初期化
        reset()
        //配列を保存する。
        saveArray(result: label2Array)
        saveArray(result: label4Array)
        saveArray(result: secArray)
        //再描画
        loadView()
        viewDidLoad()
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
