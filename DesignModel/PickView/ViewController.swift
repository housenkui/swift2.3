//
//  ViewController.swift
//  PickView
//
//  Created by 侯森魁 on 2017/6/4.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    var pickerView:UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setupView() {
    //创建UIPickView控件
        pickerView = UIPickerView()
        pickerView.frame = CGRectMake(0, 100,view.frame.size.width,500)
        pickerView.backgroundColor = UIColor.redColor()
        view.addSubview(pickerView)
        
        //设置代理和数据源
        pickerView.delegate    = self
        pickerView.dataSource  = self
        
        // 创建一个按钮，点击按钮获得选择框被选中的索引
        let button = UIButton(frame: CGRectMake(0,30,100,30))
        button.backgroundColor = UIColor.blueColor()
        button.setTitle("获取信息", forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(getPikerViewValue), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    /**
     获取选择框被选中的索引的方法
     */
    func getPikerViewValue(){
        print("被选中的索引为：\(pickerView.selectedRowInComponent(0))、\(pickerView.selectedRowInComponent(1))、\(pickerView.selectedRowInComponent(2))")
    }
    func addSubViews() {
    
    }
    //设置选择框的列数
    func numberOfComponentsInPickerView( pickerView: UIPickerView) -> Int {
        return 10
    }
    //设置选择框的行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1000
    }
    //设置选择框各选项的内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row) + "-" + String(component)
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print("row ==\(row)\n,component == \(component)")
    }
//    optional public func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat
//    @available(iOS 2.0, *)
//    optional public func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
        return 50
    }
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 50

    }
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        var temp  = UIView()
        
        temp.backgroundColor   = UIColor.whiteColor()
        temp.layer.borderColor = UIColor.blackColor().CGColor
        temp.layer.borderWidth = 10.0
        temp.layer.masksToBounds = true
        temp.layer.cornerRadius = 25.0
        return temp
    }
}
























































