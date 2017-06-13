//
//  ViewController.swift
//  ClassFromString
//
//  Created by 侯森魁 on 2017/6/6.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class User: NSObject {  //模型类
    var headerName:String? = ""
    
    var headerImage:String? = ""
    
    var phoneName:String? = ""
    var riskType:String? = ""
    var riskTest:String? = ""
    var name:String? = ""
    var iDNumber:String? = ""
    var city:String? = ""
    var email:String? = ""
    
    // print时会调用。相当于java中的 toString()。为了代码整洁下面的模型去了这个计算属性。测试时请下载demo
    override internal var description: String {
        return "headerName: \(headerName!) \n headImage:\(headerImage!) \n  phoneName:\(phoneName!) \n riskType:\(riskType!) \n  riskTest:\(riskTest!) \n   name: \(name!) \n iDNumber: \(iDNumber!) \n city: \(city!) \n email: \(email!) \n"
    }
}

func func1(){
    let dict01 = ["headerImage":"accountCenterHeaderImg@2x.png","headerName":"露丝","phoneName":"18154113923","riskType":"进取型","riskTest":"重新评估","name":"侯森魁","iDNumber":"341224199005060996","city":"上海浦东","email":"840737320@qq.com"]
    if let user = User.objectWithKeyValues(dict01) as? User{
        print("\(user)")
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        func1()
        
//        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"]
//        guard let ns = nameSpace as? String else{
//            return
//        }
//        let myClass: AnyClass? = NSClassFromString(ns + "." + "ViewController")
//        guard let myClassType = myClass as? ViewController.Type else{
//            
//            return
//        }
//        //        let  vc:ViewController = myClass
//        let vc  =  myClassType.init()
//        vc.test()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func test() {
        
//        let userInfoHeader = ("accountCenterHeaderImg@2x.png","露丝")
//        let userInfoBody  = (("联系方式","18154113923"),("风险偏好","进取型","重新评估"),("实名认证","侯森魁","341224199005060996"),("常住城市","上海浦东"),("邮箱","840737320@qq.com"))
//        
//        print(userInfoHeader.0)
//        
//        print(userInfoHeader.1)
//        
//        print(userInfoBody.0.0)
//
//        print(userInfoBody.1.0)
//    
//
        
        let dataSource:Array<Array<String>> = [["accountCenterHeaderImg@2x.png+露丝"], ["联系方式+18154113923","风险偏好+进取型+重新评估", "实名认证+侯森魁+341224199005060996"], ["常住城市+上海浦东", "邮箱+840737320@qq.com"]]
        
        let dict:Dictionary<String,String>   =  ["headerImage":"accountCenterHeaderImg@2x.png","headerName":"露丝"]
        let dict01:Dictionary<String,String> = ["phoneName":"18154113923"]
        let dict02:Dictionary<String,String> = ["riskType":"进取型","riskTest":"重新评估"]
        let dict03:Dictionary<String,String> = ["name":"侯森魁","iDNumber":"341224199005060996"]
        let dict04:Dictionary<String,String> = ["city":"上海浦东","email":"840737320@qq.com"]
   
        
        let dataSource01:Array<Array<Dictionary<String,String>>>  = [[dict],[dict01,dict02,dict03],[dict03,dict04]]

        let dictionary:Dictionary<String,String> = ["headerImage":"accountCenterHeaderImg@2x.png","headerName":"露丝","phoneName":"18154113923","riskType":"进取型","riskTest":"重新评估","name":"侯森魁","iDNumber":"341224199005060996","city":"上海浦东","email":"840737320@qq.com"]
        
        
//        let header :String =  dict["headerImage"]!
//        
//        let name :String =  dict["name"]!
//
//        print(header)
//        print(name)
        
//        var arrayModel = Array<Any>()
//        for array:[String] in dataSource {
//
//            if array.count == 1 {
//                let string = array.first!
//                let arr =  string.componentsSeparatedByString("+")
//                model.headImage = arr.first!
//                model.name = arr.last!
//            }
//            if array.count == 2 {
//                
//            }
//            if array.count == 3 {
//                
//            }
//            
//           arrayModel.append(model)
//        }
//        print(arrayModel)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}

