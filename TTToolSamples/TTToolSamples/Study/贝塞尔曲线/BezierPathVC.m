//
//  BezierPathVC.m
//  TTToolSamples
//
//  Created by admin on 2018/7/30.
//  Copyright © 2018年 tongfy. All rights reserved.
//

#import "BezierPathVC.h"

@interface BezierPathVC ()

@end

@implementation BezierPathVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGRect rect = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    CGSize radii = CGSizeMake(5, 5);//圆角
    UIRectCorner corners = UIRectCornerAllCorners;
    //create path
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    //create shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 0.5;//line的高度
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    shapeLayer.lineDashPattern = @[[NSNumber numberWithInt:4.0], [NSNumber numberWithInt:4.0]];//画虚线(虚线宽、虚线间隔)
    //add it to our view
    [self.view.layer addSublayer:shapeLayer];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
