//
//  ViewController.swift
//  NSURLConnection
//
//  Created by 侯森魁 on 2017/6/17.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

import UIKit
import Common
class ViewController: UIViewController {

    func XHPrint<N>(message: N, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
        
        #if DEBUG // 若是Debug模式下，则打印
            let path = URL.init(fileURLWithPath: fileName)
            print("\(path.lastPathComponent)  \(lineNumber) \(methodName) \(message)");
        #endif
    }
    //在控制器声明一个全局的变量，存储解析到data数据
    var jsonData:NSMutableData = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        httpAsynchronousRequest()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //同步请求方式
    func httpSynchronousRequest()  {
        
        //1.创建URL对象
        let url:URL!  = URL(string:"http://api.iclient.ifeng.com/ClientNews?id=SYLB10,SYDT10")
        
        //2.创建Request对象
        let urlRequest = URLRequest(url:url)
        
        //3.发起NSURLConnection连接
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: .main) { (response:URLResponse?, data:Data?, error:Error?) in
            
            if (error != nil ) {
                
                print(error?.localizedDescription ?? "")
            } else {
                do{
                    let dic = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(dic)
                }catch let error{
                    print(error.localizedDescription)

                }
            }
            
        }
        
    }
    
    //异步请求方式
    func httpAsynchronousRequest(){
        
        //1.创建URL对象
        let url:URL! = URL(string:"http://api.iclient.ifeng.com/ClientNews?id=SYLB10,SYDT10")
        
        //2.创建Request对象
        let urlRequest:URLRequest = URLRequest(url:url)
        
        //3.发起NSURLConnection连接
        let conn:NSURLConnection? = NSURLConnection(request:urlRequest,delegate:self)
        conn?.schedule(in: .current, forMode: .defaultRunLoopMode)
        conn?.start()
    }
}
//MARK:NSURLConnectionDataDelegate
extension ViewController:NSURLConnectionDataDelegate{
    
    func connection(_ connection: NSURLConnection, willSend request: URLRequest, redirectResponse response: URLResponse?) -> URLRequest? {
        //发送请求
        XHPrint(message: "发送请求")
        return request
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        XHPrint(message: "接收响应")
        //接收响应
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        //收到数据
        XHPrint(message: "收到数据 ==\(data)")

        self.jsonData.append(data)
    }
    
    func connection(_ connection: NSURLConnection, needNewBodyStream request: URLRequest) -> InputStream? {
        //需要新的内容流
        XHPrint(message: "需要新的内容流")

        return request.httpBodyStream
    }
    
    func connection(_ connection: NSURLConnection, didSendBodyData bytesWritten: Int, totalBytesWritten: Int, totalBytesExpectedToWrite: Int) {
        
        
        XHPrint(message: "发送数据请求==\(bytesWritten)")

        //发送数据请求
    }
    
    func connection(_ connection: NSURLConnection, willCacheResponse cachedResponse: CachedURLResponse) -> CachedURLResponse? {
        XHPrint(message: "缓存响应")

        //缓存响应
        
        return cachedResponse
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        //请求结束
        XHPrint(message: "请求结束")
        do {
            let dic  =  try JSONSerialization.jsonObject(with: self.jsonData as Data, options: JSONSerialization.ReadingOptions.allowFragments)
            print(dic)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}











































































































































































































