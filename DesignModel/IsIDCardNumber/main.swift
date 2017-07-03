//
//  main.swift
//  IsIDCardNumber
//
//  Created by 侯森魁 on 2017/6/19.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import Foundation

print("Hello, World!")

//MARK:身份证号码的正确
func isIdentityCard(IDCardNumber: String?, withIsRequred: Bool) ->(result: Bool, msg: String){
    if ((IDCardNumber ?? "").characters.count == 0) {
        if(!withIsRequred){
            return(true, "")
        }else{
            return(false, "输入的身份证号格式错误")
        }
    }
    
    let emailRegex = "^(\\d{14}|\\d{17})(\\d|[xX])$"
    let result = isMatch(IDCardNumber ?? "", withRegExp: emailRegex);
    return(result, result ? "" : "输入的身份证号格式错误")
    
}
 func isMatch(toCompareString: String, withRegExp regularExpression: String) -> Bool{
    let regextestmobile = NSPredicate(format: "SELF MATCHES %@",regularExpression)
    return regextestmobile.evaluateWithObject(toCompareString)
}



let idCardNumber = "34122419900500996"

let result = isIdentityCard(idCardNumber,withIsRequred: true)

print(result)
