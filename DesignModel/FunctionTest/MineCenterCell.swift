//
//  MineCenterCell.swift
//  DesignModel
//
//  Created by 侯森魁 on 2017/6/3.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class MineCenterCell: UITableViewCell {
    
    
    var TitleString:String?
    var iconImageName:String?
    
    var TitleLabel:UILabel?
    var iconImageView:UIImageView?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.iconImageView=UIImageView()
        
        self.contentView.addSubview(self.iconImageView!)
        
        self.TitleLabel=UILabel()
        
        self.contentView.addSubview(self.TitleLabel!)
        
        setUpviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setUpviews() {
        
        if self.iconImageName != nil {
            
            self.iconImageView?.image=UIImage(named: iconImageName!)
            
            self.TitleLabel?.text=self.TitleString
            
        }
        
        self.iconImageView?.snp_makeConstraints(closure: { (make) in
            
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.left.equalTo(5)
            make.width.equalTo(self.iconImageView!.snp_height)
            
        })
        
        
        self.TitleLabel?.snp_makeConstraints(closure: { (make) in
            
            make.left.equalTo(self.iconImageView!.snp_right).offset(10)
            make.centerY.equalTo(self.iconImageView!.snp_centerY)
            
        })
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setUpviews()
        
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
