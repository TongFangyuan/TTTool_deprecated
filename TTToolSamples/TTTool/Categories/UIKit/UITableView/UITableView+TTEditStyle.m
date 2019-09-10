//
//  UITableView+TTEditStyle.m
//  NongBao
//
//  Created by Tong on 2019/9/10.
//

#import "UITableView+TTEditStyle.h"

@implementation UITableView (TTEditStyle)

- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index{
    [super insertSubview:view atIndex:index];
    /// ios 11以上是撇
    if (@available(iOS 11.0, *)) {
    if ([view isKindOfClass:[UITableViewCell class]]) {
        NSLog(@"⚠️ 如果你的tableview出现问题，注视这段代码，再试试🐸");
        [view setNeedsLayout];
    }
    }
    
}

@end
