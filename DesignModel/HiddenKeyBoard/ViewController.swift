//
//  ViewController.swift
//  HiddenKeyBoard
//
//  Created by 侯森魁 on 2017/6/26.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    
    private let LimitBehindPoint = 1

    var button:InputButton?
    
    var textField:UITextField?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupView() {
        
        button = InputButton.init(frame: CGRectMake(0, 0, 200, 40))
        button?.center = self.view.center
        button?.backgroundColor = UIColor.redColor()
//        self.view.addSubview(button!)
        button?.addTarget(self, action: #selector(onclick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        textField = UITextField.init(frame: CGRectMake(0, 0, 200, 40))
        textField?.backgroundColor = UIColor.redColor()
        textField?.center = self.view.center
        textField?.textAlignment = .Right
        
        textField?.delegate = self

        self.view.addSubview(textField!)
        
    }

    func onclick(sender:UIButton) {
        
        button?.becomeFirstResponder()
        print(" button?.becomeFirstResponder()")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        
        return true
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
extension ViewController:UITextFieldDelegate {
    
    
    //MARK:点击Return 收键盘
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    //MARK: shouldChangeCharactersInRange
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
        
        //    let count = textField.text?.characters.count
        //
        //    let strLength =  count! - range.length + string.length;
        //
        //    if strLength <= 5 {
        //      return true
        //    }
        //    else {
        //      return false
        //    }
        
        print("string = \(string),range = \(range),textField.text = \(textField.text!)")
        
        if textField.text!.isEmpty && string == "."{
            textField.text = "0."
        }
        
        switch string {
        case "0","1","2","3","4","5","6","7","8","9":
            
            let array = Array((textField.text ?? "").characters)
            if let index = array.indexOf(".") {
                if index == array.count - LimitBehindPoint - 1 {
                    return false
                }
            }
            //限制5位
            if array.count >= 5 {
                return false
            } else {
                return true
            }
        case ".":
            let array = Array((textField.text ?? "").characters)
            var decimalCount = 0
            for character in array {
                if character == "." {
                    decimalCount = decimalCount + 1
                }
            }
            
            if decimalCount == 1 {
                return false
            } else {
                return true
            }
        default:
            //删除按钮是""
            if string.isEmpty {
                return true
            }
            return false
        }
    }

}
