//
//  ViewController.swift
//  WebViewTest01
//
//  Created by 史蒂夫 on 2017/6/1.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var webView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = self.view.bounds
        self.view.addSubview(webView)
        
        let string = "https://img4app.1caifu.com/Upload/ProductPDF/20170228//腾云固收-债券1号私募证券投资基金.pdf"
        
        let url = NSURLEncodeString(string)

        webView.loadRequest(NSURLRequest.init(URL: url))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    internal func NSURLEncodeString(encode: String?) -> NSURL{
        let encodeStr = encode ?? "";
        if let  encodeValue = encodeStr.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()){
            return NSURLWithString(encodeValue)
        }
        return NSURL()
        
    }
    internal func NSURLWithString(url: String) -> NSURL{
        if let urlStr = NSURL(string: url) {
            return urlStr
        }
        return NSURL()
    }

    


}

