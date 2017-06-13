//
//  main.swift
//  GenericParadig
//
//  Created by 侯森魁 on 2017/6/10.
//  Copyright © 2017年 小虎金融. All rights reserved.
//
/*
 Swift 的泛型有点奇怪，针对Class和Function,都是通过<Type>来定义
 
 */
import Foundation

print("Hello, World!")

func swapTwoValue<T>( a:inout T, _ b:inout T)  {
    let temp = a
    a = b
    b = temp
}
class CanPrintBase<T>{
    
    func PrintType(output:T) -> Void {
        
    }
}

//面对Interface,也就是Swift里面的Protocol,需要使用associatedType关键字来定义泛型

protocol CanPrint {
    
    associatedtype E
    
    func PrintType(E:inout) {
    
       print("fe")
    }
}
//那要怎么去实现这个接口呢？
class TypePrinter0:CanPrint {
    typealias E = String
    
    func PrintType(output: E) {
        
        print(type(of:output))
    }
}












































































































