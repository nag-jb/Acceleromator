//
//  GameViewController.swift
//  Acceleromator
//
//  Created by Sallivan James on 2021/02/12.
//

import UIKit
//加速度センサーに必要なフレームワーク
import CoreMotion

class GameViewController: UIViewController {
    
    @IBOutlet var awaImageView: UIImageView!
    let motionManager = CMMotionManager()
    var accelerationX: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //加速度計が使用できるか判別
        if motionManager.isAccelerometerAvailable{
            //加速度の取得間隔の設定
            motionManager.accelerometerUpdateInterval = 0.01
            //加速度計が更新された時に呼ばれる関数
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!) {data, error in
                //現在の加速度を取得、その値に基づきawaImageViewの座標を更新
                self.accelerationX = (data?.acceleration.x)!
                self.awaImageView.center.x += CGFloat(self.accelerationX*20)
                
                //awaImageViewが水平器からはみ出してはいけないのでX座標の限界を設定
                if self.awaImageView.frame.origin.x < 40{
                    self.awaImageView.frame.origin.x = 40
                }
                
                if self.awaImageView.frame.origin.x > 290{
                    self.awaImageView.frame.origin.x = 290
                }
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let resultViewController: ResultViewController = segue.destination as! ResultViewController
        resultViewController.accelerationX = self.accelerationX
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
