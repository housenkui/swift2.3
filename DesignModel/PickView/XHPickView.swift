//
//  XHPickView.swift
//  DesignModel
//
//  Created by 侯森魁 on 2017/6/26.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class XHPickView: UIView,UIPickerViewDelegate,UIPickerViewDataSource {

    
     private lazy  var pickerView:UIPickerView = {
    
       var temp = UIPickerView()
//        temp.backgroundColor = UIColor.redColor()
        //设置代理和数据源
        temp.delegate    = self
        temp.dataSource  = self
        return temp
    
    }()
    
    //数据源
    var array  = []
    
    private lazy var cancleBtn:UIButton = {
        
        var temp = UIButton.init(type: UIButtonType.Custom)
        temp.setTitle("取消", forState: UIControlState.Normal)
        temp.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        temp.addTarget(self, action: #selector(cancleSelect(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return temp
    }()

    func cancleSelect(sender:UIButton) {
        
        self.removeFromSuperview()
    }
    
    private lazy var sureBtn:UIButton = {
        
        var temp = UIButton.init(type: UIButtonType.Custom)
        temp.setTitle("确定", forState: UIControlState.Normal)
        temp.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        temp.addTarget(self, action: #selector(sureSelect(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return temp
    }()
    
    func sureSelect(sender:UIButton) {
        
        let selectRow = pickerView.selectedRowInComponent(0)
        
        print("被选中的索引为：\(array[selectRow])")
        

        self.removeFromSuperview()
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor  = UIColor.grayColor().CGColor
        self.layer.borderWidth  = 1.0/UIScreen.mainScreen().scale

//        self.backgroundColor = UIColor.redColor()
        setupView()
    }
    
    func setupView() {
     
        self.addSubview(cancleBtn)
        cancleBtn.snp_makeConstraints { (make) in
            make.left.top.equalTo(self)
            make.height.equalTo(44)
            make.width.equalTo(120)
        }
        
        self.addSubview(sureBtn)
        sureBtn.snp_makeConstraints { (make) in
            make.right.top.equalTo(self)
            make.height.equalTo(44)
            make.width.equalTo(120)
        }
        
        self.addSubview(pickerView)
        pickerView.snp_makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(200)
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //设置选择框的列数
    func numberOfComponentsInPickerView( pickerView: UIPickerView) -> Int {
        return 1
    }
    //设置选择框的行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    //设置选择框各选项的内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        print("row  =\(row)")
        return array[row] as? String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print("row ==\(row)\n,component == \(component)")
    }

    

}
