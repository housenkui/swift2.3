//
//  InputButton.swift
//  DesignModel
//
//  Created by 侯森魁 on 2017/6/27.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class InputButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView ()
    }
    func setupView () {
        
    }
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
