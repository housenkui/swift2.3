//
//  ViewController.swift
//  textField
//
//  Created by 侯森魁 on 2017/6/4.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    lazy var  customView:NameAuthView = NameAuthView(frame: CGRectZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
             setupView()
        
    }
    
    
    func setupView() {
        addSubViews()
        makeConstraints()
    }
    func addSubViews() {
        // 闭包的回调
        customView.submitButtonCallBack = { () -> () in
            
            print("点击了提交")
        }
        customView.cancleButtonCallBack = { () -> () in
            
            print("点击了取消")
        }
        view.addSubview(customView)
    }
    func makeConstraints() {
        
        customView.snp_makeConstraints { (make) in
            make.width.equalTo(view)
            make.top.equalTo(view).inset(64)
            make.leading.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
    
    override func updateViewConstraints() {
        makeConstraints()
        super.updateViewConstraints()
    }

}

