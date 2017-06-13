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
        
        let starView = StarView.init(frame: CGRectZero)
        view.addSubview(starView)
        
        starView.snp_makeConstraints { (make) in
            make.center.equalTo(view)
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

