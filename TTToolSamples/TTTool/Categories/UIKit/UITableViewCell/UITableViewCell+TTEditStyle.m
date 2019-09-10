//
//  UITableViewCell+TTEditStyle.m
//  TTToolSamples
//
//  Created by Tong on 2019/9/9.
//

#import "UITableViewCell+TTEditStyle.h"

#pragma mark - ------------- 工具类 ------------------
static NSString *kClsKey = @"kClsKey";
@interface TTTableViewCellEditStyleTool : NSObject

+ (instancetype)shareTool;

- (void)registerClass:(Class)cls forStyleReuseIdentifier:(NSString *)identifier editStyle:(UITableViewCellEditButtonStyle *)style;
- (nullable NSDictionary *)configWithClass:(Class)cls;

@end

@interface TTTableViewCellEditStyleTool()

@property (nonatomic,strong) NSMutableDictionary *cls_map;

@end

@implementation TTTableViewCellEditStyleTool

- (void)registerClass:(Class)cls forStyleReuseIdentifier:(NSString *)identifier editStyle:(UITableViewCellEditButtonStyle *)style {
    
    NSString *key = NSStringFromClass(cls);
    NSMutableDictionary *styleMap = self.cls_map[key];
    if (styleMap) {
        [styleMap setObject:style forKey:identifier];
    } else {
        styleMap = @{identifier:style}.mutableCopy;
        [self.cls_map setObject:styleMap forKey:key];
    }
    
}

- (nullable NSDictionary *)configWithClass:(Class)cls {
    return self.cls_map[NSStringFromClass(cls)];
}

#pragma mark - 单例
static id _shareInstance;

+ (instancetype)shareTool {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _shareInstance = [self new];
    });
    return _shareInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [super allocWithZone:zone];
    });
    return _shareInstance;
}

- (id)copyWithZone:(NSZone *)zone{
    return _shareInstance;
}


- (instancetype)init {
    if (self=[super init]) {
        self.cls_map = [NSMutableDictionary dictionary];
    }
    return self;
}
@end

#pragma mark - ------------- UITableViewCell分类 ------------------
@implementation UITableViewCell (TTEditStyle)

+ (void)tt_registerStyle:(UITableViewCellEditButtonStyle *)style forActionTitle:(NSString *)identifier {
    [[TTTableViewCellEditStyleTool shareTool] registerClass:[self class] forStyleReuseIdentifier:identifier editStyle:style];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self tt_configEditStyle];
}

static NSString *kUITableViewCellDeleteConfirmationView = @"UITableViewCellDeleteConfirmationView";

- (void)tt_configEditStyle {
    NSDictionary *styleMap = [[TTTableViewCellEditStyleTool shareTool] configWithClass:[self class]];
    if (!styleMap) return;
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(kUITableViewCellDeleteConfirmationView)]) {
            for (UIButton *btn in view.subviews) {
                if ([btn isKindOfClass:[UIButton class]]) {
                    NSString *title = btn.titleLabel.text;
                    UITableViewCellEditButtonStyle *style = styleMap[title];
                    [self _configBtn:btn style:style];
                }
            }
        }
    }
}

- (void)_configBtn:(UIButton *)btn style:(UITableViewCellEditButtonStyle *)style {
    style.backgroundColor ? btn.backgroundColor=style.backgroundColor : nil;
    style.font ? btn.titleLabel.font=style.font : nil;
    style.textColor ? btn.titleLabel.textColor=style.textColor : nil;
}

@end


#pragma mark - ------------- 样式 ------------------
@implementation UITableViewCellEditButtonStyle

@end

