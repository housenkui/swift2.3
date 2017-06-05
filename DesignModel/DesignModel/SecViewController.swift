//
//  SecViewController.swift
//  DesignModel
//
//  Created by 史蒂夫 on 2017/5/26.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

//创建一个协议，并附带一个方法

@objc protocol SubViewControllerDelegate {
    
   optional  func back(str:String) ->Void
}

class SecViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    //设置代理属性
     var delegate:SubViewControllerDelegate?
    
    /*
      var delegate:SubViewControllerDelegate! 参数不能为空，对应OC中的nonnull
     
      var delegate:SubViewControllerDelegate？ 参数可以为空，对应OC中的nullable

     
     */
    
    
    @IBAction func backBtnTap(sender: AnyObject) {
        
        //执行代理方法，将值回传
        delegate?.back?(textView.text ?? "")
        
        /*
         
         在类中使用的时候则可以直接通过可空链判断：
         delegate?.method?()  真6
         
         //http://www.jianshu.com/p/da44d1fd8440
         
         
         */
        
        self.navigationController?.popViewControllerAnimated(true)
        
        /*
         self.navigationController? 是否实现了popViewControllerAnimated(:)方法
         */
        
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        
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



























































































































































































