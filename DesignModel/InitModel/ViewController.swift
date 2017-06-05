//
//  ViewController.swift
//  InitModel
//
//  Created by 史蒂夫 on 2017/5/29.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

func XHPrint<N>(message: N, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
    
    #if DEBUG // 若是Debug模式下，则打印
        
        print("\(fileName as NSString)\n方法名:\(methodName)\n行数:\(lineNumber)\n打印信息\(message)");
    #endif
}

/*
 指定初始化（Designated）
 
 1.可以有多个指定初始化方法
 
 */
class SKPerson {
    var name:String    = ""
    var age:Int        = 0
    var weight:Double  = 0.0
    var height:Double  = 0.0
    
    init(name:String,height:Double) {
        self.name      = name
        self.height    = height
    }
    init(name:String) {
        self.name      = name
    }
    
    //定义一个convenience修饰的初始化方法，如果在同一个类中必须调用其他没有convenience修饰的初始化方法
    convenience init (name:String,age:Int) {
        self.init(name:name)
        self.age = age
    }
    
    convenience init(name:String,age:Int,weight:Double){
        self.init(name:name,age:age)
        self.weight = weight
    }
}

//子类
class Man:SKPerson {
    var address:String  = ""
    
    init(name: String,age:Int,weight:Double) {
        //3.必须调用父类指定初始化方法，不能调用convenience 修饰的方便初始化方法
        super.init(name: name)
    }
    
}
/*
 */
class woman: SKPerson {
    
    var address:String = ""
    
    //重写父类指定初始化方法
    override init(name:String)
    {
        super.init(name: name)
    }
    
    //重写父类convenience 修饰的初始化方法 不需要添加override 关键字
    init(name: String, age:Int,weight:Double) {
        super.init(name: name)
    }
    //创建自己的初始化方法
    //定义一个convenience 修饰的初始化方法，如果在同一个类中必须调用其他没有convenience修饰的初始化方法
    convenience init(name:String,age:Int,weight:Double,address:String){
        
        self.init(name: name)

        self.address  = address
        self.age    = age
        self.weight = weight
        
        //Use of 'self' in property access 'address'before self.init initializes self
    }

}



class Man0: SKPerson {
    
    var address:String = ""
    //创建一个可能失败的初始化方法
    convenience init?(name:String,age:Int,weight:Double,address:String){
        if name == "" {
            return nil
        }
        self.init(name:name)
        self.address = address
        self.age     = age
        self.weight  = weight
    }
    
}

enum UnitTemperature {
    
    // kelvn,celsius,fahrenheit  百度翻译的到 kelvn,摄氏度，华氏度
    case kelvn,celsius,fahrenheit
    
    init?(symbol:Character) {
        switch symbol {
        case  "K":
            self = .kelvn
         case "C":
            self = .celsius
         case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}


//例子2：子类将父类可能失败的初始化方法，修改为不会失败的类型
class Animal {
    
    var name:String
    init?(name:String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    
}

//对于可能出现空值得对象或者其他类型，在使用之前必须进行验证

enum TemperatureUnit:Character {
    case kelvin = "K",celsius  = "C",fahrenheit = "F"
}

func test() -> Void {
    

    if (TemperatureUnit(rawValue:"F")) != nil  {
        
        ((print("This is a defined temperature unit, so initialization succeeded.")))
    }
    
    /*
     if ((TemperatureUnit(rawValue:"F")) != nil)  {
     
     ((print("This is a defined temperature unit, so initialization succeeded.")))
     }
     
     可以正常编译
     */
    
}

//http://www.jianshu.com/p/89cd7817645c

/*
 需求：创建一个文件类，文件名字可以为nil，但是不能为空即""
 */
//写法一：
class Document{
    var name :String?
    init?(name:String?) {
        if name != nil && name!.isEmpty {
            return nil
        }
        self.name = name
    }
    //只有一种初始化方法,也就是说,不管有没有名字,我们都需要给初始化传个参数,显然这样不合理,目标不明确
}
//写法二：
class Document0{
    var name:String?
    init() {}//专门初始化name为nil的情况
    
    
    //判断入参 是否为nil 和”“
    init?(name:String) {
        if name.isEmpty {
            return nil
            //传入的名字，肯定不为nil，只需要判断是否为空即可
        }
        self.name  = name
    }
    
}

/*
 需要的初始化方法
 注意
 1.子类必须重写父类用requested修饰的方法
 2.可以和convenience组合使用
 */


class SKPerson01:NSObject{
    
    var name:String
    var age:Int = 0
    var weight:Double = 0.0
    var height:Double = 0.0
    init(name:String,height:Double) {
        
        self.name = name
        self.height = height
    }
    init(name:String) {
        
        self.name = name
    }
    //要求子类必须重写这个方法
    required convenience init(name:String,age:Int,weight:Double){
        self.init(name:name)
        self.age     = age
        self.weight  = weight
    }

}

//a.2子类重写父类要求的初始化方法
class Man01:SKPerson01 {
    
    var address:String = ""
    //重写父类要求的初始化convenience修饰的方法，不需要添加override关键字
    required  init(name: String, age:Int,weight:Double) {
        super.init(name: name)
    }
    func study() -> Void {
        
        print("i can study .")
    }
   
    //在对象被释放前调用
    deinit {

        print("Man01对象被释放")
        // 返回内部类名
        print("deinit: \(object_getClassName(self))")

        // 返回应用程序名+类名
        print("deinit: \(NSStringFromClass(type(of: self)))")
        
        print("deinit: \(type(of: self))")
        
    }
    func load() -> Void {
        
    }
    
}

//反初始化（deinit）

class ViewController: UIViewController {

    
    var  man:Man01?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        test()
        
        XHPrint(message: 12312)

        
        man = Man01.init(name: "hsk", age: 26, weight: 130.0)
        
        //man?,中的?代表man是否存在
        man?.study()
        
        let dispatchTime = DispatchTime.now() + 2.0
        
        print("开始")
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            // your function here
            
           self.releaseMan()
           print("结束")

        }
        
        if "".isEmpty{
            
            print(".isEmpty")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func releaseMan() -> Void {
        
        man = nil

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




































































































































