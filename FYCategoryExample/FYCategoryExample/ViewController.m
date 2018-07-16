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
    
    [FYTimeWatch startForEventName:@"FYTimeWatch test"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.141592653 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [FYTimeWatch stop];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self fy_showInput:@"文本" desc:@"请输入文本内容" handle:^(UITextField *textField) {
        NSLog(@"%@",textField.text);
    }];
    
}

- (IBAction)alertAction:(id)sender {
    
    [self fy_showTitle:@"提示" message:@"提示内容" confirmHandler:^{
        NSLog(@"确定");
    } cancelHandler:^{
        NSLog(@"取消");
    }];
}

@end
