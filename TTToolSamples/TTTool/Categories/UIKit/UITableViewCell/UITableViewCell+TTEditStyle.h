//
//  UITableViewCell+TTEditStyle.h
//  TTToolSamples
//
//  Created by Tong on 2019/9/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class UITableViewCellEditButtonStyle;
@interface UITableViewCell (TTEditStyle)

+ (void)tt_registerStyle:(UITableViewCellEditButtonStyle *)style forActionTitle:(NSString *)title;

@end

@interface UITableViewCellEditButtonStyle : NSObject

@property (nonatomic,strong) UIFont  *font;
@property (nonatomic,strong) UIColor *textColor;
@property (nonatomic,strong) UIColor *backgroundColor;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) UIImage *backgroundImage;

@end

NS_ASSUME_NONNULL_END
