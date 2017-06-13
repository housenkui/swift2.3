//
//  ViewController.swift
//  TakePhotoUseSwift
//
//  Created by 侯森魁 on 2017/6/8.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var button :UIButton =  {[weak self] in
        var temp  = UIButton.init(type: UIButtonType.Custom)
        temp.frame = CGRectMake(0,200,300,300)
        temp.backgroundColor = UIColor.redColor()
        temp.addTarget(self, action: #selector(test(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        temp.setTitle("按钮", forState: UIControlState.Normal)
        return temp
    }()

    func test(sender:UIButton) -> Void {
        sender.setTitle("点了", forState: UIControlState.Normal)
        
        XHTakePhoto.sharePicture { (image) -> (Void) in
            
            sender.setImage(image, forState: UIControlState.Normal)
        }
        print("点了")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

