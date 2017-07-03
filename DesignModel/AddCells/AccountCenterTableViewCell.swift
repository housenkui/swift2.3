//
//  AccountCenterHeaderCell.swift
//  JiutianZhike
//
//  Created by 侯森魁 on 2017/6/3.
//  Copyright © 2017年 Srs. All rights reserved.
//

import UIKit
//MARK:AccountCenterTableViewCell
class SelectCertificateCell: UITableViewCell{
    
    
//    private lazy var Certificate:UILabel = UILabel(mm_title: "所在区域", Color: UIColor(argb: 0x666666), fontSize: 17.0, alignment: NSTextAlignment.Center, Lines: 1)

//    private lazy var
    //MARK:类似于容器View
    lazy var customView    :UIView          =   UIView()
   
    //MARK:cell初始化方法
    required  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        //MARK:取消选中效果
        selectionStyle = UITableViewCellSelectionStyle.None
        setupView()
    }
    //MARK:cell设置View
    func setupView() {
        contentView.addSubview(customView)
        customView.snp_makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(contentView)
        }
    }
    //MARK:初始化器
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:cell选中调用方法
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
