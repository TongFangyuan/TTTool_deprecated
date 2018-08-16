//
//  ResizeTransformViewController.m
//  TTToolSamples
//
//  Created by admin on 2018/7/23.
//  Copyright © 2018年 tongfy. All rights reserved.
//

#import "ResizeTransformViewController.h"
#import "UIView+Draw.h"

@interface ResizeTransformViewController ()

@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISlider *widthSlider;
@property (weak, nonatomic) IBOutlet UISlider *heightSlider;

@end

@implementation ResizeTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.greenView.center = self.view.center;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)rotate90Degress:(id)sender {
    NSLog(@"[befor]%@",NSStringFromCGRect(self.label.frame));
    self.label.transform =  CGAffineTransformMakeRotation((90 * M_PI) / 180.0f);
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    NSLog(@"[after]%@",NSStringFromCGRect(self.label.frame));
    NSLog(@"[tranform]%@",NSStringFromCGRect(CGRectApplyAffineTransform(self.label.frame, self.label.transform)));
}

- (IBAction)widthChange:(UISlider *)sender {
    self.label.bounds = CGRectMake(0, 0, self.widthSlider.value, self.heightSlider.value);
}
- (IBAction)heightChange:(UISlider *)sender {
    self.label.bounds = CGRectMake(0, 0, self.widthSlider.value, self.heightSlider.value);
}

@end
