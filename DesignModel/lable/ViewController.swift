//
//  ViewController.swift
//  lable
//
//  Created by 侯森魁 on 2017/6/4.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy  var subtitleLabel  :UILabel = {
        var tempLabel = UILabel()
        tempLabel.frame = CGRectMake(10, 100, 500, 30)
        tempLabel.font = UIFont.systemFontOfSize(13)
        tempLabel.numberOfLines = 1
        tempLabel.textAlignment = NSTextAlignment.Left
        return tempLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        let attributedString = NSMutableAttributedString.init()//初始化
        
        let needIntegral = 1000//还需要多少积分才能领取
        
        attributedString.appendAttributedString(self.appendColorStrWithString("您还需要", font: 20, color: UIColor.blackColor()))//调用方法
        attributedString.appendAttributedString(self.appendColorStrWithString("\(needIntegral)", font: 14, color: UIColor.redColor()))
        attributedString.appendAttributedString(self.appendColorStrWithString("积分才能兑换该商品", font: 14, color: UIColor.blueColor()))
        
        self.subtitleLabel.attributedText = attributedString//赋值

        view.addSubview(subtitleLabel)
        
    }

//    //传入字符串、字体      返回NSMutableAttributedString
//    private func appendStrWithString(str:String,font:CGFloat) -> NSMutableAttributedString {
//        var attributedString : NSMutableAttributedString
//        let attStr = NSMutableAttributedString.init(string: str, attributes: [NSFontAttributeName : UIFont.systemFontOfSize(font)])
//        attributedString = NSMutableAttributedString.init(attributedString: attStr)
//        return attributedString
//    }
    
    //传入字符串、字体、颜色      返回NSMutableAttributedString
    
    private func appendColorStrWithString(str:String,font:CGFloat,color:UIColor) -> NSMutableAttributedString {
        var attributedString : NSMutableAttributedString
        let attStr = NSMutableAttributedString.init(string: str, attributes: [NSFontAttributeName : UIFont.systemFontOfSize(font),NSForegroundColorAttributeName:color])
        attributedString = NSMutableAttributedString.init(attributedString: attStr)
        return attributedString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





















