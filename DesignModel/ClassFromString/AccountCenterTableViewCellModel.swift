//
//  AccountCenterHeaderCellModel.swift
//  JiutianZhike
//
//  Created by 侯森魁 on 2017/6/3.
//  Copyright © 2017年 Srs. All rights reserved.
//

import UIKit

class AccountCenterHeaderCellModel: AccountCenterTableViewCellModel {
    
}

class AccountCenterTableViewCellModel: NSObject {

    /*
     数据源
     let dictionary:Dictionary<String,String> = ["headerImage":"accountCenterHeaderImg@2x.png","headerName":"露丝","phoneName":"18154113923","riskType":"进取型","riskTest":"重新评估","name":"侯森魁","iDNumber":"341224199005060996","city":"上海浦东","email":"840737320@qq.com"]
     */
    //get set函数已经实现了
    var headerName:String? = ""
    
    var headImage:String? = ""
    
    var phoneName:String = ""
    var riskType:String = ""
    var riskTest:String = ""
    var name:String = ""
    var iDNumber:String = ""
    var city:String = ""
    var email:String = ""

    
    var bodyCell:Bool = false
    var headerCell:Bool = false
    
    init(_ sourcesArray:Array<String>) {
        
        self.name = sourcesArray.last!
        self.headImage = sourcesArray.first!
        
    }
    
      
    required override init() {
        fatalError("init() has not been implemented")
    }

}

class AccountCenterBodyCellModel: AccountCenterTableViewCellModel{
    
}
