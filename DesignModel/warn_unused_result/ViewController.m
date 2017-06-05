//
//  ViewController.m
//  warn_unused_result
//
//  Created by 侯森魁 on 2017/6/5.
//  Copyright © 2017年 小虎金融. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*
 warn_unused_result 这个关键字的含义：如果某个函数使用了这个关键字，那么函数在被调用的时候，要检查或者使用返回值，否则编译器会进行警告。
 使用场合：在把一些功能封装起来(或者SDK的编写)时候，如果对返回值的使用比较重要，那么使用这个关键字提醒编译器要检查返回值是否被利用。
 
 
 */
- (BOOL)TestFunc:(NSInteger)num __attribute__ ((warn_unused_result)){
    
    return num > 0?YES:NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    BOOL result  =  [self TestFunc:10];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

























































































































































