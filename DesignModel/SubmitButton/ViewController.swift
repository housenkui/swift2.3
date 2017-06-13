//
//  ViewController.swift
//  SubmitButton
//
//  Created by 侯森魁 on 2017/6/9.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = UILabel.init(mm_title: "我是标签", Color: UIColor.blueColor(), fontSize: 15.0, alignment: NSTextAlignment.Center, Lines: 1)
        
        label.frame = CGRectMake(0, 0, 100, 40)
        label.center  = view.center
        view.addSubview(label)
        
        let btn = UIButton.init(title: "我是按我是按是按钮钮", bgColor: UIColor.redColor(), fontSize: 15.0, alignment: NSTextAlignment.Center)
        
        btn.frame = CGRectMake(0, 100, 100, 40)
//        btn.center = view.center
        view.addSubview(btn)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UILabel {
    
    public convenience init(mm_title title:String,Color:UIColor = UIColor.darkGrayColor(),fontSize:CGFloat = 14 ,alignment: NSTextAlignment = .Left,Lines: Int = 0) {
        self.init()
        
        text = title
        textColor = Color
        numberOfLines = 0
        font = UIFont.systemFontOfSize(fontSize)
        textAlignment = alignment
        numberOfLines = Lines
        
        sizeToFit()
        
    }
 }
extension UIButton {
    
    public convenience init(title:String,bgColor:UIColor = UIColor.redColor(),fontSize:CGFloat = 14,alignment:NSTextAlignment = NSTextAlignment.Center){
        self.init()
        setTitle(title, forState: UIControlState.Normal)
        backgroundColor  = bgColor
        titleLabel?.font = UIFont.systemFontOfSize(fontSize)
        titleLabel?.textAlignment = alignment
        titleLabel?.sizeToFit()
        titleLabel?.adjustsFontSizeToFitWidth = true
        
    }
    
//    public convenience init(mm_title title:String,Color:UIColor = UIColor.darkGrayColor(),fontSize:CGFloat = 14 ,alignment: NSTextAlignment = .Left,Lines: Int = 0) {
//        self.init()
//        
//        text = title
//        textColor = Color
//        numberOfLines = 0
//        font = UIFont.systemFontOfSize(fontSize)
//        textAlignment = alignment
//        numberOfLines = Lines
//        
//        sizeToFit()
//        
//    }
}
