//
//  ViewController.swift
//  lesson5.kadai
//
//  Created by natsumi on 2016/09/22.
//  Copyright © 2016年 natsumi.okusada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func onTapimage(sender: AnyObject) {
        
        // セグエを使用して画面を遷移
        performSegueWithIdentifier("result", sender: nil)
    }
    
    @IBAction func onStart(sender: AnyObject) {
        
        if timer == nil{
            timer = NSTimer.scheduledTimerWithTimeInterval(
                2.0,
                target: self,
                selector: #selector(self.onNext(_:)),
                userInfo: nil,
                repeats: true
            )
            
            //ボタン無効
            onPrev.enabled = false;
            onNext.enabled = false;
            //stratをstopに変える記述
            startbutton.setTitle("Stop", forState: .Normal)
            
        }else{
            timer!.invalidate()
            timer = nil
            //ボタン有効
            onPrev.enabled = true;
            onNext.enabled = true;
            
            //stopをstartに戻す
           startbutton.setTitle("Start", forState: .Normal)
            
        }
    }
    
    
    @IBOutlet weak var startbutton: UIButton!
  
    @IBOutlet weak var onPrev: UIButton!
    @IBAction func onPrev(sender: AnyObject) {
 
    
    
    //　表示している画像の番号を１減らす
        
    dispImageNo -= 1
    
    //表示している画像の番号を元に画像を表示する
    displayImage()
    
           }
    
    @IBOutlet weak var onNext: UIButton!
    @IBAction func onNext(sender: AnyObject) {
   
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
        

    }


    
    /// 一定の間隔で処理を行うためのタイマー
    var timer: NSTimer?

    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "photo.1.jpg",
            "photo.2.jpg",
            "photo.3.jpg",
            "photo.4.jpg",
            ]
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 3
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 3 {
            dispImageNo = 0
            
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startbutton.setTitle("start", forState: .Normal)
        
        // バンドルした画像ファイルを読み込み
        let image = UIImage(named: "photo.1.jpg")
        
        // Image Viewに画像を設定
        imageView.image = image

        
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destinationViewController as! ResultViewController
        
        
        resultViewController.x = dispImageNo
        
        /// 表示している画像の番号
        // var dispImageNo = 0
        
    
        
        
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    

}

