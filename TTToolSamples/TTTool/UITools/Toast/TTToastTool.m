//
//  TTToastTool.m
//  TTToolSamples
//
//  Created by Tong on 2019/7/17.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import "TTToastTool.h"

@implementation TTToastTool

+ (void)show:(NSString *)msg {
    dispatch_main_async_safe(^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:UIApplication.sharedApplication.keyWindow animated:YES];
        hud.label.text = msg;
        hud.animationType = MBProgressHUDAnimationZoomOut;
        hud.mode = MBProgressHUDModeText;
        hud.removeFromSuperViewOnHide = YES;
        hud.bezelView.backgroundColor = [UIColor blackColor];
        hud.backgroundView.backgroundColor = [UIColor clearColor];
        hud.offset = CGPointMake(0, 150);
        hud.margin = 5;
        hud.label.textColor = [UIColor whiteColor];
        hud.label.font = [UIFont tt_pingFangSCFontWithSize:14.f];
        hud.label.numberOfLines = 0;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}

+ (void)debug_show:(NSString *)msg {

#ifdef DEBUG
    [self show:msg];
#endif

}
@end
