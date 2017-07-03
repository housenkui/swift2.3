//
//  XHPrint.swift
//  DesignModel
//
//  Created by 侯森魁 on 2017/6/17.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

public class XHPrint: NSObject {

   
   public class func info<N>(message: N, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
        
        #if DEBUG // 若是Debug模式下，则打印
            
            print("\(fileName)\n方法名:\(methodName)\n行数:\(lineNumber)\n\(message)");
        #endif
    }

    
}
//extension UIViewController {
//    
//    
//    public class func XHPrint<N>(message: N, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
//        
//        #if DEBUG // 若是Debug模式下，则打印
//            
//            print("\(fileName)\n方法名:\(methodName)\n行数:\(lineNumber)\n\(message)");
//        #endif
//    }
//
//}

