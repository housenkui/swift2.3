//
//  ViewController.m
//  HiddenKeyBoard01
//
//  Created by 侯森魁 on 2017/6/26.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic)   UITextField *textField ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField  =  [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    self.textField.center  = self.view.center;
    self.textField.backgroundColor= [UIColor redColor];
    [self.view addSubview:self.textField];
    
    
//    NSArray *array = [window subviews];
//    
//    NSLog(@"array =%@",array);
//    
//    UIView * keyview= [[window subviews] lastObject];
    
//    NSLog(@"window = %@",window);
//
//    UIView *keyBoard = self.keyboardView;
//    NSLog(@"keyBoard = %@",keyBoard);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    // Do any additional setup after loading the view, typically from a nib.
}

- (UIView *)keyboardView
{
    
    
    
    UIWindow* tempWindow;
    
    //Because we cant get access to the UIKeyboard throught the SDK we will just use UIView.
    //UIKeyboard is a subclass of UIView anyways
    UIView* keyboard;
    
    NSLog(@"windows %ld", [[[UIApplication sharedApplication]windows]count]);
    
    //Check each window in our application
    for(int c = 0; c < [[[UIApplication sharedApplication] windows] count]; c ++)
    {
        //Get a reference of the current window
        tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:c];
        
        //Get a reference of the current view
        for(int i = 0; i < [tempWindow.subviews count]; i++)
        {
            keyboard = [tempWindow.subviews objectAtIndex:i];
            NSLog(@"view: %@, on index: %d, class: %@", [keyboard description], i, [[tempWindow.subviews objectAtIndex:i] class]);
            if([[keyboard description] hasPrefix:@"(lessThen)UIKeyboard"] == YES)
            {
                //If we get to this point, then our UIView "keyboard" is referencing our keyboard.
                return keyboard;
            }
        }
        
        for(UIView* potentialKeyboard in tempWindow.subviews)
            // if the real keyboard-view is found, remember it.
            if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
                if([[potentialKeyboard description] hasPrefix:@"<UILayoutContainerView"] == YES)
                    keyboard = potentialKeyboard;
            }
            else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
                if([[potentialKeyboard description] hasPrefix:@"<UIPeripheralHost"] == YES)
                    keyboard = potentialKeyboard;
            }
            else {
                if([[potentialKeyboard description] hasPrefix:@"<UIKeyboard"] == YES)
                    keyboard = potentialKeyboard;
            }
    }
    
    return keyboard;
}

- (void)keyboardWillShow:(NSNotification *)notification{

    
    UIWindow *window  =  [[UIApplication sharedApplication] windows].lastObject;

    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(0, 600, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [window addSubview:redView];
    
    NSArray * windows = [[UIApplication sharedApplication] windows];
    
    for (UIWindow *window in windows) {
        
        NSLog(@"window = %@",window);
        
        for (UIView *tempView in window.subviews) {
            
            NSLog(@"tempView = %@",tempView);
            
        }
        
    }


}

- (void)keyboardDidShow:(NSNotification *)notification{
//    UIView *keyboardView = [self getKeyboardView];
//    NSLog(@"keyboardView = %@",keyboardView);
    
    NSArray * windows = [[UIApplication sharedApplication] windows];
    
    for (UIWindow *window in windows) {
        
        NSLog(@"window = %@",window);
        
        for (UIView *tempView in window.subviews) {
            
            NSLog(@"tempView = %@",tempView);

        }
        
    }
    
}
- (UIView *)getKeyboardView{
    UIView *result = nil;
    NSArray *windowsArray = [UIApplication sharedApplication].windows;
    for (UIView *tmpWindow in windowsArray) {
        NSArray *viewArray = [tmpWindow subviews];
        for (UIView *tmpView  in viewArray) {
            if ([[NSString stringWithUTF8String:object_getClassName(tmpView)] isEqualToString:@"UIPeripheralHostView"]) {
                result = tmpView;
                break;
            }
        }
        
        if (result != nil) {
            break;
        }
    }
    
    return result;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    [self.textField endEditing:YES];
}
@end
