//
//  FirstViewController.swift
//  DesignModel
//
//  Created by 史蒂夫 on 2017/5/26.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBAction func goSub(sender: UIButton) {
        
        let  subVC = UIStoryboard.init(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("SubViewController") as! SubViewController
        
        //实现回调，获取回调回来的值(闭包)
        subVC.backClosure = {
            
            (backStr:String) -> Void in
            
            self.label.text = backStr
        }
        
        /*
         闭包的一般形式：
         {
            (parameters) -> returnType in 
         
             statements
         }
         
         
         * 这里的参数（parameters）,可以是in-out（输入输出参数），但不能设定默认值。如果是可变参数，必须放在最后一位，不然编译器报错。元祖也可以作为参数或者返回值。
         * 'in' 关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始。即由in引入函数
         
         */
        self.navigationController?.pushViewController(subVC, animated: true)

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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




























































































