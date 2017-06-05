//
//  SKCustomTableViewCell.swift
//  DesignModel
//
//  Created by 侯森魁 on 2017/6/3.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

private let SKMargin:CGFloat = 10
private let imgSize:CGFloat = 60
private let titleWidth:CGFloat = UIScreen.mainScreen().bounds.width - 3.0*SKMargin - imgSize
class SKCustomTableViewCell: UITableViewCell {

    lazy  var customView    :UIView      = { return UIView()      }()
    lazy  var titleLabel    :UILabel     = { return UILabel()     }()
    lazy  var headImageView :UIImageView = { return UIImageView() }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    class func cellHeight() -> CGFloat {
        return 80
    }
    
    class func customCellWithTableView(tableView:UITableView?,cellForRowAtIndexPath indexPath: NSIndexPath,sourcesArray:NSArray)->SKCustomTableViewCell {
        let skCustomTableViewCellIdentifier = "skCustomTableViewCellIdentifier"
        var cell = tableView?.dequeueReusableCellWithIdentifier(skCustomTableViewCellIdentifier) as? SKCustomTableViewCell
        if cell == nil {
            cell = SKCustomTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: skCustomTableViewCellIdentifier)
        }
        let textModel = TextModel.init(sourcesArray)
        
        cell?.cellWithModel(textModel)
        
        return cell!

    }
    func setupView() {
        addSubViews()
        titleLabel.font = UIFont.systemFontOfSize(15)
        titleLabel.numberOfLines = 0
        makeConstraints()
    }
    func addSubViews() {
        self.contentView.addSubview(customView)
        //头像
        customView.addSubview(headImageView)
        customView.addSubview(titleLabel)
    }
    //MARK:snapKit布局
    func makeConstraints() {
        customView.snp_makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalTo(self.contentView)
        }
        headImageView.snp_makeConstraints { (make) in
            make.top.equalTo(customView).inset(SKMargin)
            make.leading.equalTo(customView).inset(SKMargin)
            make.width.height.equalTo(imgSize)
        }
        titleLabel.snp_makeConstraints { (make) in
            make.leading.equalTo(headImageView).inset(imgSize + SKMargin)
            make.top.equalTo(customView).inset(SKMargin)
            make.width.equalTo(titleWidth)
            make.height.equalTo(imgSize)
        }
    }
    
    func cellWithModel(model:TextModel?) {
        if let tempModel = model {
            titleLabel.text = tempModel.name
            headImageView.image = UIImage(named: tempModel.headImage)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
























































