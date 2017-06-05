//
//  NameAuthView.swift
//  DesignModel
//
//  Created by 侯森魁 on 2017/6/4.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit


//  自定义View

import UIKit

private let  kMargin:CGFloat  = 20.0
private let  kHeight:CGFloat  = 44.0

class NameAuthView: UIView,UITextFieldDelegate{

    // 闭包 类似oc中的block
    var submitButtonCallBack:(() -> ())?
    var cancleButtonCallBack:(() -> ())?

    lazy var phoneNameTextField:UITextField = {
            var temp                  =  UITextField()
            temp.keyboardType         = UIKeyboardType.NumberPad
            temp.placeholder          = "请输入您的手机号码"
            temp.clearButtonMode      = UITextFieldViewMode.WhileEditing
            temp.delegate             = self
            return temp
            
    }()
    lazy var IDTextField:UITextField =  {
        
        var temp                  =  UITextField()
        temp.keyboardType         = UIKeyboardType.NumbersAndPunctuation
        temp.placeholder          = "请输入18位身份证号"
        temp.clearButtonMode      = UITextFieldViewMode.WhileEditing
        temp.delegate             = self
        return temp
        
    }()
    lazy var lineImageView01:UIImageView = {
        
            var temp                  =  UIImageView()
            temp.image = UIImage.init(named: "nameAuthLine@2x.png")
            return temp
        
    }()
    lazy var lineImageView02:UIImageView = {
        
        var temp                  =  UIImageView()
        temp.image = UIImage.init(named: "nameAuthLine@2x.png")
        return temp
        
    }()
    lazy var submitButton:UIButton = {
        
        var temp                  =  UIButton.init(type: UIButtonType.Custom)
        temp.setTitle("提交", forState: UIControlState.Normal)
        temp.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        temp.backgroundColor = UIColor.init(red: 229/255.0, green: 72/255.0, blue: 72/255.0, alpha: 1.0)
        temp.addTarget(self, action: #selector(submitButtonClick(_ :)), forControlEvents: UIControlEvents.TouchUpInside)
        temp.layer.masksToBounds = true
        temp.layer.cornerRadius  = 2
        return temp
        
    }()
    lazy var cancelButton:UIButton = {
        
        var temp                  =  UIButton.init(type: UIButtonType.Custom)
        temp.setTitle("取消", forState: UIControlState.Normal)
        temp.setTitleColor(UIColor.init(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1.0), forState: UIControlState.Normal)
        temp.backgroundColor = UIColor.init(red: 229/255.0, green: 229/255.0, blue: 229/255.0, alpha: 1.0)
        temp.addTarget(self, action: #selector(cancleButtonClick(_ :)), forControlEvents: UIControlEvents.TouchUpInside)
        temp.layer.masksToBounds = true
        temp.layer.cornerRadius  = 2
        return temp
        
    }()

    // 重写init方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()

        setupView()
    }
    
    func setupView()  {
        addSubViews()
        makeConstraints()
    }
    func addSubViews() {
        self.addSubview(phoneNameTextField)
        self.addSubview(IDTextField)
        self.addSubview(lineImageView01)
        self.addSubview(lineImageView02)
        self.addSubview(submitButton)
        self.addSubview(cancelButton)


    }
    func makeConstraints() {
        phoneNameTextField.snp_makeConstraints { (make) in
            
            make.top.equalTo(self).inset(1.0)
            make.leading.trailing.equalTo(self).inset(kMargin)
            make.height.equalTo(kHeight)

        }
        IDTextField.snp_makeConstraints { (make) in
            make.top.equalTo(lineImageView01).inset(1.0)

            make.leading.trailing.equalTo(self).inset(kMargin)
            make.height.equalTo(kHeight)
        }
        lineImageView01.snp_makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.leading.width.equalTo(self)
            make.bottom.equalTo(phoneNameTextField)
        }
        lineImageView02.snp_makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.leading.width.equalTo(self)
            make.bottom.equalTo(IDTextField)
        }
        submitButton.snp_makeConstraints { (make) in
            
            make.top.equalTo(lineImageView02).inset(kMargin)

            make.leading.trailing.equalTo(self).inset(kMargin)
            make.height.equalTo(kHeight)

        }
        cancelButton.snp_makeConstraints { (make) in
            
            make.top.equalTo(submitButton).inset(kMargin + kHeight)
            
            make.leading.trailing.equalTo(self).inset(kMargin)
            make.height.equalTo(kHeight)
            
        }
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 按钮点击事件的调用
       func submitButtonClick(button: UIButton){
        
        let phoneNameText:String? = phoneNameTextField.text
        let IDText:String? = IDTextField.text
        
        if (phoneNameText!.isEmpty){
            
            return
        }
        if (IDText!.isEmpty) {
            
            return
        }
        
        if submitButtonCallBack != nil {
            submitButtonCallBack!()
        }
    }
    func cancleButtonClick(button:UIButton)  {
        if cancleButtonCallBack != nil {
            cancleButtonCallBack!()
        }
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}
