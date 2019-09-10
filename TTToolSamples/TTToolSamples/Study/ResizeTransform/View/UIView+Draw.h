//
//  UIView+Draw.h
//  TTToolSamples
//
//  Created by Tong on 2018/7/11.
//  Copyright © 2019 tongfy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    DBTapType1, //点了一下
    DBTapType2, //点了两下
} DBTapType;

typedef void(^DBNormalBlock)();
typedef void(^DBMoveChangeBlock)(CGPoint translation);
typedef void(^DBTapBlock)(DBTapType tapType);
typedef void(^DBPointChangeBlock)(CGFloat deltaX, CGFloat deltaY);
typedef void(^DBSizeChangeBlock)(CGFloat deltaWidth, CGFloat deltaHeight);

@interface UIView (Draw)

@property (nonatomic) BOOL isMoveLocked;
@property (nonatomic) BOOL isDrawView;
@property (nonatomic) BOOL isResizingR;
@property (nonatomic) BOOL isResizingD;

@property (nonatomic) CGPoint touchStart;
@property (nonatomic) CGRect  startFrame;

@property (nonatomic) UIImageView *rightEar;
@property (nonatomic) UIImageView *chin;
@property (nonatomic) CAShapeLayer *dottedLayer;

@property (nonatomic) DBNormalBlock          moveStart;
@property (nonatomic) DBMoveChangeBlock      moveChange;
@property (nonatomic) DBNormalBlock          moveEnd;
@property (nonatomic) DBNormalBlock          moveCanceled;

@property (nonatomic) DBPointChangeBlock     pointChange;
@property (nonatomic) DBSizeChangeBlock      sizeChange;

@property (nonatomic) DBTapBlock             tap;

- (void)updateDottedLayerShow:(BOOL)show;
- (void)updateBottomChinHidden:(BOOL)isHidden;
- (void)updateRightEarHidden:(BOOL)isHidden;

- (void)setupDrawSubViewsIfNeeded;
- (void)setupAllGestureRecognizers;

@end
