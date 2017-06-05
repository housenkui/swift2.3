//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by 侯森魁 on 2017/6/3.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

   lazy var tableView:UITableView = {return UITableView() }()
    
    //懒加载
    lazy var players:[String] = {
        
        var tempPlayers = [String]()
        tempPlayers.append("head_image.jpg")
        tempPlayers.append("就是不肯睡觉世界杯上看见 深刻理解错那算了是考虑的技能测试了")
        return tempPlayers
        
    }()

    
    override func loadView() {
        super.loadView()
        print(#function)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)

        setupUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }

    func setupUI() {
        
        tableView.delegate = self
        tableView.dataSource = self;
        view.addSubview(tableView)
        
      
    }
    override func updateViewConstraints() {
        print(#function)

        self.tableView.snp_makeConstraints { (make) in
            make.trailing.leading.bottom.equalTo(self.view)
            //tableView和self.view左边、右边、下面对
            make.top.equalTo(self.view).inset(64)
            //tableView和self.view的顶部相差64像素
        }
        super.updateViewConstraints()
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return SKCustomTableViewCell.cellHeight()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        return SKCustomTableViewCell.customCellWithTableView(tableView, cellForRowAtIndexPath: indexPath, sourcesArray: players)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("clicked at \(indexPath.row)")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






















































































































