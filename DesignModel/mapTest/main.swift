//
//  main.swift
//  mapTest
//
//  Created by 侯森魁 on 2017/6/4.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import Foundation

let arr  = [1 ,2, 3]
let doubled  = arr.map {
 $0 * 2
}
print(doubled)

let moneyArray = [10, 20, 30, 40]
let stringsArray = moneyArray.map {
    "\($0)" + "¥"
}
print(moneyArray)


let num:Int? = 3

let result  = num.map{
    $0 * 2
}
print(result)
