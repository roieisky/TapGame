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
    
    //let defaults = UserDefaults.standard
    let label2ArrayForKey:String = "label2Key"
    let label4ArrayForKey:String = "label4Key"
    
    // section毎の画像配列
    var label2Array:Array<String> = []//Array(repeating: "?", count: 10)
                                /*["02:00","04:00","04:30","05:00",
                                "05:09","06:00","09:00","10:00",
                                "10:00","10:00"]*/
    var label4Array:Array<String> = []//Array(repeating: "?", count: 10)
                                /*["2018/04/20","2018/04/18","2018/04/20","2018/04/19",
                                "2018/04/16","2018/04/13","2018/04/12","2018/04/10",
                                "2018/04/10","2018/04/10"]*/

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label2Array = readlabel2Array() 
        label4Array = readlabel4Array() 
        
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
        
        //let img = UIImage(named: imgArray[indexPath.row] as! String)
        
        // Tag番号 1 で UIImageView インスタンスの生成
        //let imageView = cell.viewWithTag(1) as! UIImageView
        //imageView.image = img
        
        // Tag番号 ２ で UILabel インスタンスの生成
        let label1 = cell.viewWithTag(1) as! UILabel
        label1.text = "No." + String(indexPath.row + 1)
        
        // Tag番号 ３ で UILabel インスタンスの生成
        let label2 = cell.viewWithTag(2) as! UILabel
        label2.text = String(describing: label2Array[indexPath.row])
        
        let label3 = cell.viewWithTag(3) as! UILabel
        label3.text = "秒"
        
        let label4 = cell.viewWithTag(4) as! UILabel
        label4.text = String(describing: label4Array[indexPath.row])
        
        return cell
    }
    // Cell の高さを１２０にする
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
    }

    // 保存する
    func saveArray(result: Array<String>) {
        let defaults = UserDefaults.standard
        defaults.set(label2Array, forKey:label2ArrayForKey)
        defaults.set(label4Array, forKey:label4ArrayForKey)
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
    //reset
    func reset(){
        //初期化
        label2Array = Array(repeating: "?", count: 10)
        label4Array = Array(repeating: "?", count: 10)
    }
    @IBAction func resetAction(_ sender: UIButton) {
        //初期化
        reset()
        //配列を保存する。
        saveArray(result: label2Array)
        saveArray(result: label4Array)
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
