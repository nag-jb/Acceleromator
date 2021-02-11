//
//  ResultViewController.swift
//  Acceleromator
//
//  Created by Sallivan James on 2021/02/12.
//

import UIKit

class ResultViewController: UIViewController {

    //iPhoneの傾きを標示する変数
    var accelerationX: Double!
    
    //iPhoneの傾きをしめすラベル
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result: Double = fabs(accelerationX*100)
        label.text = String(format: "%.1f",result)

        // Do any additional setup after loading the view.
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
