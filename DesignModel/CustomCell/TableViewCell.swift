//
//  TableViewCell.swift
//  DesignModel
//
//  Created by 史蒂夫 on 2017/6/1.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    var title:UILabel!
    var clickBtn:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
          setUpUI()
        }
    
    func setUpUI()  {
        
            title = UILabel(frame: CGRectMake(20, 20, 200, 30))
            self.contentView.addSubview(title)
            clickBtn = UIButton(frame: CGRectMake(200, 20, 60, 30))
            clickBtn.setTitle("app", forState: UIControlState.Normal)
            clickBtn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            clickBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
            self.contentView.addSubview(clickBtn)

    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
