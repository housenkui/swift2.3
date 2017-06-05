//
//  ViewController.swift
//  FunctionTest
//
//  Created by 史蒂夫 on 2017/6/1.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var materialTableview :UITableView =  {
        
        weak var weakSelf  = self
        var tableView  =  UITableView()
        
        tableView.frame = weakSelf!.view.bounds
        
        tableView.backgroundColor = UIColor.redColor()
        return tableView
        
    }()
    lazy var tableView = UITableView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        greet("housenkui", day: "Sunday")
        
        greet01("housenkui", "Sunday")
        
        view.addSubview(self.materialTableview)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func greet( person:String,day:String){
        
        print("Hello \(person),today is \(day)")
    }
    
    func greet01(_ person:String,_ day:String){
        
        print("Hello \(person),today is \(day)")
    }
    
    

}

