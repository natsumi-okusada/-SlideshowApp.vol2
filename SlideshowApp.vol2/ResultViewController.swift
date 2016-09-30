//
//  ResultViewController.swift
//  lesson5.kadai
//
//  Created by natsumi on 2016/09/27.
//  Copyright © 2016年 natsumi.okusada. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var x:Int = 0
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    
    @IBOutlet weak var detailImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let imageNameArray = [
            "photo.1.jpg",
            "photo.2.jpg",
            "photo.3.jpg",
            "photo.4.jpg",
            ]
        
        let name:String = imageNameArray[x]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに画像を設定
        detailImageView.image = image
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
