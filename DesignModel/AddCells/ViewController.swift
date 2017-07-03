//
//  ViewController.swift
//  AddCells
//
//  Created by 侯森魁 on 2017/6/24.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
//    private lazy var footerView: UIView = {
//    
//        var temp = UIView()
//        temp.backgroundColor = UIColor.whiteColor()
//        return temp
//    
//    }()
    
    //MARK:懒加载tableView
    private lazy var tableView: UITableView = {
        
        var tempTableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Grouped)
        tempTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tempTableView.delegate   = self
        tempTableView.dataSource = self
        tempTableView.backgroundColor  = UIColor.redColor()
        tempTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")

        tempTableView.registerClass(SelectCertificateCell.self, forCellReuseIdentifier: "SelectCertificateCell")

        return tempTableView
        
    }()
    
    var array = [""]

    private func setupView() {
        
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
          make.left.right.top.equalTo(view)
          make.bottom.equalTo(view).inset(100)
        }
//        tableView.tableFooterView = footerView
//        
//        view.addSubview(footerView)
//        
//        footerView.snp_makeConstraints { (make) in
//            make.left.right.equalTo(tableView)
//            make.height.equalTo(44.0)
//            make.bottom.equalTo(tableView)
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return array.count
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    //MARK:每个section尾部View的高度
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == (array.count - 1) {
            
            let temp = UIButton.init(type: .Custom)
            
            temp.setTitle("添加", forState: UIControlState.Normal)
            temp.addTarget(self, action: #selector(addCell(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            temp.backgroundColor = UIColor.clearColor()
            
            let label = UILabel()
            temp.addSubview(label)
            label.backgroundColor = UIColor.greenColor()
            label.snp_makeConstraints(closure: { (make) in
                make.left.top.height.equalTo(temp)
                make.width.equalTo(100)
                
            })
            return temp
        }
        return nil

    }
    //MARK:每个section头部View的高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        cell.backgroundColor = UIColor.greenColor()
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("clicked at \(indexPath.row)")
        

    }
    
    func addCell(sender:UIButton) {
        
        array.append("")
        tableView.reloadData()
        
        let indexPath = NSIndexPath.init(forRow: 0, inSection: array.count-1)
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: true)

    }
    

}

