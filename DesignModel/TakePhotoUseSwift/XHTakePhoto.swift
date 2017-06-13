//
//  XHTakePhoto.swift
//  DesignModel
//
//  Created by 侯森魁 on 2017/6/8.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

typealias sendPictureClosure = (image:UIImage)->(Void)

internal let shareInstance:XHTakePhoto = { return  XHTakePhoto()}()

final class XHTakePhoto: NSObject,UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var sPClosure:sendPictureClosure?
    
    //单例
    private override init(){}
    
    class func sharePicture(closure:sendPictureClosure){
        
        shareInstance.sPClosure = closure
        
        let alertVC = UIAlertController.init(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        alertVC .addAction(UIAlertAction.init(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil))
        alertVC .addAction(UIAlertAction.init(title: "拍照", style: UIAlertActionStyle.Default, handler: {
            (action:UIAlertAction) in
            shareInstance.takePictures(UIImagePickerControllerSourceType.PhotoLibrary)
        }))
        alertVC .addAction(UIAlertAction.init(title: "从相册选取", style: UIAlertActionStyle.Default, handler: {
            (action:UIAlertAction) in
            shareInstance.takePictures(UIImagePickerControllerSourceType.Camera)
        }))
        
        shareInstance.getRootVC().presentViewController(alertVC, animated: true, completion: nil)
    
    }
    func takePictures(imagePickerControllerSourceType:UIImagePickerControllerSourceType) -> Void {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            
            imagePickerController.sourceType = imagePickerControllerSourceType;
        }
        else{
            imagePickerController.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;

        }
        getRootVC().presentViewController(imagePickerController, animated: true, completion: nil)
        
    }

    //选择完成回调
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        let image:UIImage = (info[UIImagePickerControllerEditedImage] as? UIImage)!
        
         shareInstance.sPClosure?(image: image);
    }

    func getRootVC() -> UIViewController{
        let window :UIWindow = UIApplication.sharedApplication().keyWindow!
        let rootVc = window.rootViewController
        return rootVc!
    }

    
}

























































































































