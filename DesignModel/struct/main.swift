//
//  main.swift
//  struct
//
//  Created by 侯森魁 on 2017/6/27.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import Foundation

struct Person {
    var firstName: String
    var secondName: String? // optional value
    var salary: Int
    
    // default designed init - 默认的指定初始化方法
    init() {
        firstName = "flion"
        salary = 100
    }
    
    // 带参数的指定初始化
    init(firstName: String, secondName: String?, salary: Int) {
        self.firstName = firstName
        self.secondName = secondName
        self.salary = salary
    }
    
    
    func eat(foodName: String) -> Void {
        print("eat food " + foodName)
    }
    
    
    func fullName() -> String {
        if let tempSecondName = secondName {
            return firstName + "-" + tempSecondName
        } else {
            return firstName
        }
    }
}

var flion = Person(firstName: "flion", secondName: "dep", salary: 100)

flion.firstName = "侯森魁"
print(flion.fullName())












