
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var arr = [1, 2, 4, 5, 6, 9, 10, 15];
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    /*
     @noescape 用来标记一个闭包，用法如下
     
     */
    func hostFunc(@noescape closure:() -> ()) -> Void {
        
        let queue = dispatch_get_global_queue(0, 0)
        
        dispatch_async(queue, {
            //以下编译出错，closure被修饰后，不能被其他异步线程捕获
//            closure()
            
            dispatch_async(dispatch_get_main_queue(), {
                
            })
            
        })
//     Generator,可以返回多次
//filter也是一个常用的操作，它用于把Array的某些元素过滤掉，然后返回剩下的元素。
    }
    /*
     @noescape字面意思是无法逃脱，在上例子中，closure被@noescape修饰，则声明closure的生命周期不能超过hostFunc,并且，closure不能被hostFunc中的其他闭包捕获(也就是强制持有)
     
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
































