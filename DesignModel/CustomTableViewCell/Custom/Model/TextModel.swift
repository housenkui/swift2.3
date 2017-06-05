//
//  TextModel.swift
//  DesignModel
//
//  Created by 侯森魁 on 2017/6/3.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class TextModel: NSObject {

    //get set函数已经实现了
    var name = String()
    var headImage = String()
    
    init(_ sourcesArray:NSArray) {
        
        self.name = (sourcesArray.lastObject as? String)!
        self.headImage = (sourcesArray.firstObject as? String)!
        
    }
}
