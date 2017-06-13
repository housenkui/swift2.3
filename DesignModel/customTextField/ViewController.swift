//
//  ViewController.swift
//  customTextField
//
//  Created by 侯森魁 on 2017/6/9.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textField = UITextField.init(placeholder:"请输入登录密码",keyBoardType: UIKeyboardType.EmailAddress)
        textField.frame = CGRectMake(100, 300, 200, 40)
        view.addSubview(textField)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UITextField {
    
    public convenience init(mm_title title: String, holder: String = "", Color: UIColor = UIColor.darkGrayColor(), fontSize: CGFloat = 14, alignment: NSTextAlignment = .Left, placeholderColor: UIColor = UIColor.darkGrayColor()) {
        self.init()
        
        text = title
        textColor = Color
        font = UIFont.systemFontOfSize(fontSize)
        textAlignment = alignment
        placeholder = holder
        attributedPlaceholder = NSAttributedString(string: holder, attributes: [NSForegroundColorAttributeName : placeholderColor])
        
        sizeToFit()
    }
    
    //参数默认的构造函数
    public convenience init(placeholder holder: String,keyBoardType:UIKeyboardType,Color: UIColor = UIColor.darkGrayColor(), fontSize: CGFloat = 17, alignment: NSTextAlignment = .Left, placeholderColor: UIColor = UIColor.init(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1.0),clearButtonMode:UITextFieldViewMode = UITextFieldViewMode.WhileEditing) {
        self.init()
        textColor = Color
        font = UIFont.systemFontOfSize(fontSize)
        textAlignment = alignment
        placeholder = holder
        attributedPlaceholder = NSAttributedString(string: holder, attributes: [NSForegroundColorAttributeName : placeholderColor])
        self.keyboardType = keyBoardType
        self.clearButtonMode = clearButtonMode
        sizeToFit()
    }
    
}
