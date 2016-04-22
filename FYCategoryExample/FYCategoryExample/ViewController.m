//
//  ViewController.m
//  FYCategoryExample
//
//  Created by IOS on 15/10/13.
//  Copyright (c) 2015年 IOS. All rights reserved.
//

#import "ViewController.h"
#import "FYCategory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (IBAction)alertAction:(id)sender {
    
    [self fy_alertWithTitle:@"提示" message:@"提示内容" confirmHandler:^{
        NSLog(@"确定");
    } cancelHandler:^{
        NSLog(@"取消");
    }];
}

@end
