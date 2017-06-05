//
//  ViewController.swift
//  CustomCell
//
//  Created by 史蒂夫 on 2017/6/1.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var table:UITableView!
    var array = ["item1","item2","item3","item4","item5","item6","item7"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FirstApp"
        var view: UIView = UIView(frame: self.view.frame)
        view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(view)
        
        var leftButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action:"leftCall:")
        
        self.navigationItem.leftBarButtonItem = leftButton
        
        var rightButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "rightCall:")
        
        self.navigationItem.rightBarButtonItem = rightButton
        
        var rect  = self.view.frame
        rect.origin.y += 65
        table = UITableView(frame: rect)
        table.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(table)
        
        table.delegate = self
        table.dataSource = self
    }
 
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var str:String = "cell"
        
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(str, forIndexPath: indexPath) 
        
        if cell.isEqual(nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: str)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("clicked at \(indexPath.row)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func leftCall(sender:AnyObject) {
        table.setEditing(!table.editing, animated: true)
        var btn:UIBarButtonItem = sender as! UIBarButtonItem
        btn.title = "Done"
        print("leftButton pressed")
    }
    func rightCall(sender:AnyObject) {
        array.append("新建cell")
        table.reloadData()
        print("rightButton pressed")
    }
    func tableViewCellClicked(sender:AnyObject) {
        print("tableViewCell appButton at \((sender as! UIButton).tag) clicked")
    }
}
