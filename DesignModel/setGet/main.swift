//
//  main.swift
//  setGet
//
//  Created by 侯森魁 on 2017/6/4.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import Foundation

class People: NSObject {
    
    //普通属性
    var firstName:String  = ""
    var lastName:String = ""
    var nickName:String = ""
    
    //计算属性
    var fullName:String
    {
       
        get {
            
            return nickName + " " + firstName + " " + lastName
        }
    }
    
    //带有属性监视器的普通属性
    var age:Int = 0
    {
        //我们需要在age属性变化前做点什么
        willSet
        {
           print("Will set an new value  \(newValue) to age")
        }
        //我们需要在age属性变化后，更新一下nickName这个属性
        didSet
        {
            print("age filed changed form \(oldValue) to \(age)")
            
            if age < 10  {
                
                nickName   = "Little"
            }
            else
            {
                nickName   = "Big"
            }
        }
    }
    
    func toString() -> String {
        
        return "Full Name:\(fullName)" + ",Age:\(age)"
    }
    
}

var me  = People()

me.firstName  = "hou"
me.lastName   = "senkui"
me.age        = 26

print("\(me.toString())\n\n\n\n\n")

print(me.fullName)



/*
 
 当我们得到属性值的时候，会调用该属性的get方法
 当我们去设置属性值的时候，会调用该属性值的set方法
 当我们给属性设值的时候，Swift会自动给我们创建一个名为newValue的常量并且用于set{}中。
 Swift中有存储属性和计算属性，一般我们应该是给计算属性添加get和set方法，
 */

var A:Int  = 0
var B:Int  = 0

var C:Int {

   get {
    return 1
    }
   set {
    print("Recived new value",newValue,"and store into B")
    B = newValue
   }
}


A = C

print(A)

C = 2

print(B)
print(C)


var c:Int  = 0
var _num:Int  = 2
var num:Int  {

get {
    return _num
}
set {
    if newValue >= 2 {
        _num  = newValue
    }
    else
    {
        print("error:cannot have family with less than 2 members")
        c  = 0
        _num  = 0
    }
}
}
var a  = num

print("a = \(a)")

num  = 100

print("num =\(num)")





















































