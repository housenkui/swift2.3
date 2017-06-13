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
let stringsArray:[String] = moneyArray.map {
    "\($0)" + "¥"
}
print(moneyArray)


let num:Int? = 3

let result  = num.map{
    $0 * 2
}
print(result)


/*
 map 函数能够被数组调用，它接受一个闭包作为参数，作用于数组中的每个元素。闭包返回一个变换后的元素，接着将所有这些变换后的元素组成一个新的数组
 */
/*
1.比如我们有一个这样的需求遍历一个数组中所有的元素，将每个元素变为原来的两倍
*/
//如果不使用map函数
let numbers = [1, 2, 3]
var doubleNumbers   = [Int]()
for var number in numbers {
    number *= 2
    doubleNumbers.append(number)
}
print(doubleNumbers)

/*如果我们使用map*/

//可以看到我们甚至可以不用再定义可变数组直接用不可变的就可以
let numbers01 = [1, 2, 3]
let doubleNumbers01  = numbers01.map {
    
    (number:Int) -> Int in
    return number * 2
}
print(doubleNumbers01)
//下面介绍简便写法 因为map闭包里面的类型可以自动推断所有可以省略
let doubleNumber02  = numbers01.map{
    
    number in
    return number * 2
}
print(doubleNumber02)

let doubleNumber03 = numbers.map{
    number in
    number * 2
}
print(doubleNumber03)

//最终简化写法
let doubleNumber04 = numbers.map{
    $0 * 2
}
print(doubleNumber04)

//2.Map函数返回数组的元素类型不一定要与原数组相同
let fruit = ["apple","banna","orange",""]
//这里数组存在一个""字符串,为了后面来比较map和flatMap 
let counts = fruit.map {
    
    fruit  -> Int? in
    let length = fruit.characters.count
    guard length > 0 else {
        return nil
    }
    return length
}
print(counts)

//3.Map还能返回判断数组中的元素是否满足某种条件的Bool值数组


let array =  [1, 2, 3, 4, 5, 6]
//最简洁的写法
let isEven  = array.map { $0%2 == 0}

//这里写一下完整的写法 
let isEvent01  = array.map{
      num in
      return num % 2 == 0
}


print(isEven)
print(isEvent01)


/*
 FlatMap
 
 flatMap与map 不同之处是
 flatMap返回后的数组中不存在nil同时它会把Optional解包;
 flatMap还能把数组中存有的数组的数组一同打开变成一个新的数组
 flatMap也能把两个不同的数组组合并成一个数组这个合并的数组元素个数是前面两个数组元素个数的乘积

 */

//1.flatMap返回后的数组中不存在nil同时它会把Optional解包
let fruits01 = ["apple","banna","orange",""]
let counts01 = fruits01.flatMap{
    fruit01 -> Int? in
    let length = fruit01.characters.count
    guard length > 0 else {
        return nil
    }
    return length
}

print(counts01)

//2.flatMap 还呢把数组中存有数组的数组 一同打开变成一个新的数组(看代码秒懂)

let array01 = [[1,2,3],[4,5,6],[7,8,9]]
//如果用map来获取新的数组
let arrayMap = array01.map { $0 }

print("arrayMap===>\(arrayMap)")
//用flatMap
let arrayFlatMap  = array01.flatMap{ $0 }

print("arrayFlatMap====>\(arrayFlatMap)")

//flatMap 也能把两个不同的数组合并成一个数组 这个合并的数组元素个数是前面两个数组元素个数的乘积

let fruits02 = ["apple","banana","orange"]
let counts02 = [1,2,3]
let fruitCounts = counts02.flatMap{
    
    count in
    fruits02.map{
    fruit in
    (fruit,count)
    }
}
print("fruitCounts===>\(fruitCounts)")//[("apple", 1), ("banana", 1), ("orange", 1), ("apple", 2), ("banana", 2), ("orange", 2), ("apple", 3), ("banana", 3), ("orange", 3)]

//Filter 过滤器
/*
 filter 可以取出数组中符合条件的元素 重新组成一个新的数组
 */

let numbers03 = [1,2,3,4,5,6]
let events01 = numbers03.filter{ $0 % 2 == 0}
print(events01)

//Reduce 我们需要把所有元素的值合并成一个新的值，

//1.比如我们要获得一个数组中所有元素的和
let numbers04 = [1,2,3,4,5]
//reduce函数第一个参数是返回值的初始化值 
let sum = numbers04.reduce(0){ $0 + $1 }

print(sum)
//完整的格式
let sum01 =  numbers04.reduce(0) {

     total,num in
     return total + num

}
/*closure的格式 
 
 { 
    (参数列表) in
     表达式
 }
 
 
 */

//2.合并成的新值不一定跟原数组中的元素的类型相同
let numbers05 = [1,8,1,5]

let tel =  numbers05.reduce(""){ "\($0)" + "\($1)" }

print(tel)


//3.ruduce还可以实现map和filter 并且时间复杂度变为o(n),原来map和filter的时间复杂度是o（n * n）
extension Array {
    func mMap<U> (transform:Element -> U) -> [U] {
        return reduce([], combine: { $0 + [transform($1)]  })
    }
    func mFilter (includeElement:Element -> Bool) -> [Element] {
        return reduce([]) { includeElement($1) ? $0 + [$1] : $0 }
    }
}
































































































































































































































