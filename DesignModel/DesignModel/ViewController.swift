//
//  ViewController.swift
//  DesignModel
//
//  Created by 史蒂夫 on 2017/5/26.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

/*

 学习代理设计模式
 
 */

import UIKit

protocol XWWine {
    
    func test() -> Void
    
}
class ViewController: UIViewController{

    @IBOutlet weak var textView: UITextView!
    
    //1.分析NSArray 是一个闭包的返回值，而这是一个没有参数的闭包
    lazy var dataArray:NSMutableArray  =  { return NSMutableArray() }()
    
    //2.也可以写成这样
    lazy var dataArray01:NSArray  = {return NSArray()}()

    
    //3.从Plist文件中加载
    lazy var dataArray02:NSArray = {
    
      return NSArray ()
    
    }()
    /*
     上述的代码，有点难理解，如果之前会Objective-C的block 或者对C语言的函数指针理解透彻的，可以看成是一个代码块，然后self.dataArray的时候，就执行了代码块，但是重复调用，Lazy 属性的代码块只会调用一次,lazy修饰的是一个存储属性，而存放的是闭包,我想内部，应该进行了优化
     */

    @IBAction func test(sender: AnyObject) {
    }
    @IBAction func goSec(sender: AnyObject) {
        
        performSegueWithIdentifier("goSec", sender: nil)
    }
    
    //storyBoard 跳转处理
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goSec" {
            print("跳了")
            segue.destinationViewController as! SecViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        // 好奇葩的for循环
        for _ in 0...10
        {
            self.dataArray.addObject("1")
        }
        print(self.dataArray)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupUI() -> Void {
        
        let button = UIButton.init(type: UIButtonType.RoundedRect)
        
        button.frame = CGRectMake(100, 100, 100, 100)
        
        button.setTitle("按钮", forState: UIControlState.Normal)
        
        button.layer.masksToBounds = true
        
        button.layer.cornerRadius  = CGRectGetHeight(button.frame)/2.0
        
        button.backgroundColor = UIColor.redColor()

        button.addTarget(self,  action: #selector(onClick(withBtn :)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
    }

    //withBtn 函数参数的标签
      func onClick(withBtn sender:UIButton) -> Void {

        let  storyBoard = UIStoryboard.init(name: "Main", bundle: NSBundle.mainBundle())
        
        let secVC =  storyBoard .instantiateViewControllerWithIdentifier("SecViewController") as! SecViewController
        
        /*
         
         public func instantiateViewControllerWithIdentifier(identifier: String) -> UIViewController
         返回一个UIViewController类型，通过as! 强制转换为 其子类 SecViewController
         
         基类转换为 派生类 向下转型
         
         */
        secVC.delegate  = self
        
        self.navigationController?.pushViewController(secVC, animated: true)
        
        //self.navigationController?，这句话的含义是，如果有navigationController,才去执行，没有就不执行
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//2，as!使用场合
//向下转型（Downcasting）时使用。由于是强制类型转换，如果转换失败会报 runtime 运行错误。

class Animal {}
class Cat: Animal {}
let animal :Animal  = Cat()
let cat = animal as! Cat
/*
 swift中的代理方法如果 没有实现 编译阶段都通不过去
 */
extension ViewController: SubViewControllerDelegate{
    
    func back(str:String) -> Void{
        
        self.textView.text  = str
    }
    

}
























































