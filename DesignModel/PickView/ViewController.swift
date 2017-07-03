//
//  ViewController.swift
//  PickView
//
//  Created by 侯森魁 on 2017/6/4.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    private lazy var  xhPickView:XHPickView = {
    
     var temp =  XHPickView.init(frame: CGRectZero)
    
     let path = NSBundle.mainBundle().pathForResource("CerType", ofType: "plist") ?? ""

     temp.array = NSArray.init(contentsOfFile: path) ?? []
        
     return temp
    
    }()
    var array  = []
    
    var view4 : UIView!
    var type = false
    
    
    //创建按钮
    func initButton() -> Void {
        
        let btn = UIButton(type: .Custom)
        btn.backgroundColor = UIColor.blueColor()
        btn.addTarget(self, action: #selector(clickedBtn(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        
        btn.snp_makeConstraints { (make) in
            
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(100)
            make.width.height.equalTo(50)
        }
        
    }
    
    
    //创建视图
    func initView4() -> Void {
        
        self.view4 = UIView()
        self.view4.backgroundColor = UIColor.greenColor()
        self.view.addSubview(self.view4)
        
        self.view4.snp_makeConstraints { (make) in
            
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(244)
            make.width.equalTo(UIScreen.mainScreen().bounds.size.width)
            make.height.equalTo(244)
            
        }
    }
    
    
    
    //按钮的点击方法
    func clickedBtn(btn : UIButton) {
        
        self.type = !self.type
        if self.type {
            //动画
            UIView.animateWithDuration(0.25, animations: {
                //
                //也可以用改变的约束不多，也可以用snp_updateConstraints方法
                self.xhPickView.snp_remakeConstraints(closure: { (make) in
                    
                    make.centerX.equalTo(self.view)
                    //向上移动110
                    make.bottom.equalTo(self.view)
                    make.width.equalTo(UIScreen.mainScreen().bounds.size.width)
                    make.height.equalTo(244)
                })
                
                //用来立即刷新布局（不写无法实现动画移动，会变成瞬间移动）
                self.view.layoutIfNeeded()
            })
        }
        else{
            //动画
            UIView.animateWithDuration(0.25, animations: {
                
                self.xhPickView.snp_updateConstraints(closure: { (make) in
                    
                    //向上移244(移回去)
                    make.bottom.equalTo(self.view).offset(244)
                    
                })
                
                //用来立即刷新布局（用需要实现动画视图的父视图（self.view），用需要实现动画的视图(self.view4)好像不起作用，不要问我为什么，我写这文章前也不知道为什么，如果有人知道，请在评论里告诉我，谢谢）
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
     /*
     
     证券从业人员资格证
     银行从业人员资格证
     基金从业人员资格证
     期货从业人员资格证
     保险销售从业人员资格证
     经济师证书（金融专业）
     会计从业资格证
     法律职业资格证
     AFP证书
     CFP证书
     CFA证书
     FRM证书
     CIIA证书
     CPA证书
     其他相关证书
     
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("CerType", ofType: "plist") ?? ""
        
        array = NSArray.init(contentsOfFile: path) ?? []
        
        print("array = \(array)")
        
//        setupView()
        
        setupView()
        initButton()
//        initView4()

        
    }
    func setupView() {
        
       view.addSubview(xhPickView)
        
        xhPickView.snp_makeConstraints { (make) in
            
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(244)
            make.width.equalTo(UIScreen.mainScreen().bounds.size.width)
            make.height.equalTo(244)

       }
    }
    
       /**
     获取选择框被选中的索引的方法
     */
    func getPikerViewValue(){

//        print("被选中的索引为：\(pickerView.selectedRowInComponent(0))、\(pickerView.selectedRowInComponent(1))、\(pickerView.selectedRowInComponent(2))")
    }
    func addSubViews() {
    
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
//    optional public func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat
//    @available(iOS 2.0, *)
//    optional public func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    
//    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        
//        return 50
//    }
//    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//        
//        return 50
//
//    }
//    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
//        
//        var temp  = UIView()
//        
//        temp.backgroundColor   = UIColor.whiteColor()
//        temp.layer.borderColor = UIColor.blackColor().CGColor
//        temp.layer.borderWidth = 10.0
//        temp.layer.masksToBounds = true
//        temp.layer.cornerRadius = 25.0
//        return temp
//    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//    
//        
//        self.type = !self.type
//        if self.type {
//            
//            UIView.animateWithDuration(1.0, animations: {
//                
//                self.xhPickView.snp_remakeConstraints(closure: { (make) in
//                    
//                    make.left.right.equalTo(self.view)
//                    make.height.equalTo(244)
//                    
//                    make.bottom.equalTo(self.view)
//                    
//                    self.view.layoutIfNeeded()
//                })
//            })
//            
//        }  else {
//        
//            UIView.animateWithDuration(1.0, animations: {
//                
//                self.xhPickView.snp_updateConstraints(closure: { (make) in
//                    
////                    make.left.right.equalTo(self.view)
////                    make.height.equalTo(244)
//                    
////                    make.top.equalTo(self.view.snp_bottom)
//                    
//                      make.bottom.equalTo(self.view).offset(244)
//
//                    self.view.layoutIfNeeded()
//                })
//            })
//
//        }
//    }
}
























































