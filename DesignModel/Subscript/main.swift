//
//  main.swift
//  Subscript
//
//  Created by 侯森魁 on 2017/6/10.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import Foundation

print("Hello, World!")
//实例1：实现一个我们自定义的字符串类，可以方便的通过索引获取某一个字符值，或某一部分字符串。同时也可以通过索引，给某一部分赋值。

class SubString {
    
    var str:String = ""
    init(str:String) {
        self.str = str
    }
    
    /*下标脚本:获取/设置部分字符串*/
    subscript(start:Int,length:Int) -> String{
    
        get{
            let index1 = str.index(str.startIndex, offsetBy: start)
            let index2 = str.index(index1, offsetBy: length)
            let range = Range(uncheckedBounds:(lower:index1,upper:index2))
            return str.substring(with: range)
        }
        set {
            let tmp = str
            str = ""
            var s = ""
            var e = ""
            for(idx,item)in tmp.characters.enumerated(){
                if(idx < start){
                    s += "\(item)"
                }
                if(idx >= start + length)
                {
                    e += "\(item)"
                }
            }
            str = s + newValue + e
            
        }
    }
    
    /*下标脚本:获取/设置字符*/
    subscript(index:Int)->String
        {
        get{
            return String(str[str.index(str.startIndex, offsetBy: index)])
        }
        set{
            let tmp = str
            str = ""
            for(idx,item) in tmp.characters.enumerated() {
                if idx == index {
                    str += "\(newValue)"
                }else{
                    str += "\(item)"
                }
            }
        }
    }
}
let str = SubString(str: "www.baidu.com")

print(str[7,3])

print(str[7])

//实例1改进：通过类扩展，也可以直接给String类添加索引功能，代码如下：
extension String{
    subscript(start:Int,length:Int)->String{
        get {
            let index1 = self.index(self.startIndex, offsetBy: start)
            let index2 = self.index(index1, offsetBy: length)
            let range = Range(uncheckedBounds:(lower:index1,upper:index2))
            return self.substring(with:range)
        }
        set {
            let tmp  = self
            var s = ""
            var e = ""
            for(idx,item) in tmp.characters.enumerated() {
                if(idx < start)
                {
                    s += "\(item)"
                }
                if(idx >= start + length)
                {
                    e += "\(item)"
                }
            }
            self = s + newValue + e
        }
    }
    subscript(index:Int)->String {
        get {
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
        set{
            let tmp = self
            self = ""
            for(idx,item) in tmp.characters.enumerated() {
                if idx == index {
                    self += "\(newValue)"
                }
                else{
                    self += "\(item)"
                }
            }
        }
    }
}
var str1 = "hangge.com"
print(str1[7,3])
print(str1[7])





























































































































































