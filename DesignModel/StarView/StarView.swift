//
//  StarView.swift
//  DesignModel
//
//  Created by 侯森魁 on 2017/6/12.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class StarView: UIView {

    private let starNum:UInt = 5

    override init(frame:CGRect){
        super.init(frame:frame)
//        self.backgroundColor = UIColor.redColor()
        setupView()
    }

    func setupView() {
        
        for i in 0..<5{
            
            
            let x = i * (30 + 10) + 5
            /*
             i= 0  x =10 
             i= 1  x  =40
             i= 2   x =
             
             */

//            let imageViewBack  = UIImageView.init(image: UIImage.init(named: "backgroundStar"))
//            
//            imageViewBack.tag = 10+i
//            imageViewBack.frame = CGRectMake(CGFloat(x), 5, 30, 30)
//            
//            self.addSubview(imageViewBack)
            
            let imageViewzfore  = UIImageView.init(image: UIImage.init(named: "foregroundStar"))
            imageViewzfore.tag = 100+i
            imageViewzfore.frame = CGRectMake(CGFloat(x),5, 30, 30)
            
            self.addSubview(imageViewzfore)

            
            
            print(i)
            // 打印结果为1-9
        }
    
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch:UITouch! = touches.first
        let location = touch.locationInView(self)
        let x = location.x
        
        let arr:[UIImageView] = (self.subviews as? [UIImageView])!

        if (x >= 0 && x < 40)  {
            
            for subView:UIImageView in arr {
                if subView.tag != 100 {
                    subView.image = UIImage.init(named: "backgroundStar")
                }
            }
        }
        else if(x >= 40 && x < 80){
            
            for subView:UIImageView in arr {
                if subView.tag == 100 || subView.tag == 101 {
                    subView.image = UIImage.init(named: "foregroundStar")
                }else{
                    subView.image = UIImage.init(named: "backgroundStar")

                }
            }
        }
        else if(x >= 80 && x < 120){
            
            for subView:UIImageView in arr {
                if subView.tag == 100 || subView.tag == 101 || subView.tag == 102 {
                    subView.image = UIImage.init(named: "foregroundStar")
                }
                else{
                    subView.image = UIImage.init(named: "backgroundStar")
                }
            }

        }
        else if(x >= 120 && x < 160){
            
            for subView:UIImageView in arr {
                if subView.tag == 104{
                    subView.image = UIImage.init(named: "backgroundStar")
                }else{
                    subView.image = UIImage.init(named: "foregroundStar")

                }
            }
        }
        else if(x >= 160 && x < 200){
            
            for subView:UIImageView in arr {
                    subView.image = UIImage.init(named: "foregroundStar")
            }
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
