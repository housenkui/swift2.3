//
//  SubViewController.swift
//  DesignModel
//
//  Created by 史蒂夫 on 2017/5/26.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

//定义闭包类型 (特定的函数类型)
//起别名 也可以使用关键之'typealias'先声明一个闭包数据类型。类似于OC中的typedef起别名

typealias InputClosureType = (String) ->Void

typealias AddBlock = (Int,Int) -> (Int)

class SubViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    //接受上个页面传过来的闭包块
    var backClosure:InputClosureType?
    
    
    @IBAction func backBtnAct(sender: AnyObject) {
        
        if self.backClosure != nil {
        
            if let tempString  = self.textField.text {
                
                self.backClosure!(tempString)
            }
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       testClosure()
        
        // Do any additional setup after loading the view.
    }
    
    func testClosure() -> Void {
        
        let Add:AddBlock = {
            
            (c,d) in
            return c + d
            
        }
        let Result  = Add(100,150)
        
        print("Result  =\(Result)")
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




























































