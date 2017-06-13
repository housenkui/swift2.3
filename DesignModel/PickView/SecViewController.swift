//
//  SecViewController.swift
//  DesignModel
//
//  Created by 侯森魁 on 2017/6/5.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class SecViewController: UIViewController ,ChinessSubDivPickerDeleagte{

    lazy var chineseSubDivPickerView:ChinessSubDivPicker = {
        var temp = ChinessSubDivPicker.init(frame:CGRectMake(0, 100, 375, 400))
//        temp.frame = CGRectMake(0, 100, 375, 400)
        temp.backgroundColor  = UIColor.clearColor()
        temp.pickerDelegate = self
        temp.pickerType  = .Province
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(chineseSubDivPickerView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func subDivPickerDidUpdate(sender: ChinessSubDivPicker) {
        
        print("省======>\(sender.province ?? "")")
        print("市======>\(sender.city ?? "")")
        print("区=======>\(sender.district ?? "")")

    }
   
}


































































































