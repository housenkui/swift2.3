//
//  ViewController.swift
//  StarView
//
//  Created by 侯森魁 on 2017/6/12.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView ()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupView ()  {
        
        //        let starView = StarView.init(frame: CGRectZero)
        //        view.addSubview(starView)
        //
        //        starView.snp_makeConstraints { (make) in
        //            make.center.equalTo(view)
        //            make.height.equalTo(40)
        //            make.width.equalTo(200)
        //        }
        let view01 = UIView()
        
        view01.backgroundColor = UIColor.redColor()
        
        view01.layer.shouldRasterize = true
        view.addSubview(view01)
        
        view01.snp_makeConstraints { (make) in
            make.width.equalTo(1)
            make.height.equalTo(view)
            make.left.equalTo(view).inset(100)
            make.top.equalTo(view)
        }
        view01.transform = CGAffineTransformMakeRotation(10/3.14)
        
        UIView.animateWithDuration(10.0) {
            view01.transform = CGAffineTransformMakeRotation(100/3.14)
            
        }
        
        let view02 = UIView()
        view02.layer.shouldRasterize = true
        
        view02.backgroundColor =     UIColor.redColor()
        
        view.addSubview(view02)
        
        view02.snp_makeConstraints { (make) in
            make.width.equalTo(1)
            make.height.equalTo(view)
            make.right.equalTo(view).inset(50.0)
            make.top.equalTo(view)
        }
        view02.transform = CGAffineTransformMakeRotation(10/3.14)
        
        UIView.animateWithDuration(20.0) {
            view02.transform = CGAffineTransformMakeRotation(100/3.14)
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

