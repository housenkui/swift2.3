//
//  main.swift
//  Array_VS_NSArray
//
//  Created by 侯森魁 on 2017/6/3.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import Foundation

print("Hello, World!")
/*
 public struct Array<Element> : CollectionType, MutableCollectionType, _DestructorSafeContainer {

 public class NSArray : NSObject, NSCopying, NSMutableCopying, NSSecureCoding, NSFastEnumeration {

 在swift语言中，数据在被存储在某个数组之前，类型必须明确，且与数组的其他元素类型相同。在Swift语言中的数组和C语言中的不同，Swift语言中的数组是值类型的，不管赋值还是当作参数传递，都只是维护他的拷贝。你可以放心的操作他的拷贝，因为你做的任何操作都不会反馈回它本身，这是值类型自身的规则。
 */

//2.数组的创建

//Array型数组

//不赋初值，指定数组内数据为String类型
let array1 = [String]()

//不赋初值，Array<String>等价于[String]
let array2 = Array<String>()

//不指定数组内数据，自动推断
let array03:Array = ["bei","jing"]

//指定数组内数据类型为String
let array4:Array<String>  = ["shang","hai"]

//不指定数组内数据类型，自动推断
let array5 = ["beijing","上海"]

//指定数组内数据类型为Int 类型
let array6:[Int] = [1, 2, 3, 4, 5, 6]

//指定数组内数据类型为AnyObject类型
let array7:[AnyObject]  = [1, 2, 3, 4, 5, 6, "happy"]

//创建二维数组
let array8:Array<Array<Int>> = [[1,2,3],[3,4,5]]



//NSArray 型数组

let swiftArray:Array = ["北京","欢迎您"]

let nsArray1:NSArray  = swiftArray

let nsArray2:NSArray  = swiftArray as NSArray


let nsArray3 = NSArray()

//array:[AnyObject]
let nsArray4 = NSArray(array: array7)


//array:[AnyObject]
let nsarray6 = NSArray(array: ["bei","jing"])

//array:NSArray

let nsarray5 = NSArray(array: nsArray2)

//object:AnyObject
let nsArray7 = NSArray(objects: "qian")

//objects:AnyObject...
let nsArray8 = NSArray(objects: "bei","jing")

//从文件创建数组

let path =    NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DesktopDirectory, NSSearchPathDomainMask.UserDomainMask, true).last?.stringByAppendingString("/test.rtf")

let nsArray9:NSArray? = NSArray(contentsOfFile:path!)


print(nsArray9)



//3.数组的长度计算
//Array或NSArray型数组
let array = ["bei","jing"]

let num:Int  = array.count
//数组位置的获取

//Array型数组

let array10:Array = ["bei","jing"]

//获取数组指定下标的元素
let obj1:String = array10[1]

//获取数组的第一个元素
let obj2:String? = array10.first

//获取数组的最后一个元素
let obj3:String? = array10.last

//获取数组指定范围内的元素








































































































