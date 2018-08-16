//
//  UIView+Draw.m
//  HelloWord
//
//  Created by admin on 2018/7/11.
//  Copyright © 2018年 008. All rights reserved.
//

#import "UIView+Draw.h"
#import <objc/runtime.h>

static CGFloat kResizeThumbSize = 40.0f;
static CGFloat kMinimumSize = 1.0f;

@implementation UIView (Draw)

#pragma mark - Public

-  (void)updateDottedLayerShow:(BOOL)show {
    if (!self.isDrawView) return;

    if (!self.dottedLayer) {
        CAShapeLayer *dottedLayer = [CAShapeLayer layer];
        dottedLayer.strokeColor = [UIColor redColor].CGColor;
        dottedLayer.fillColor = nil;
        dottedLayer.lineDashPattern = @[@2, @2];
        dottedLayer.frame = self.bounds;
        dottedLayer.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
        [self.layer addSublayer:dottedLayer];
        self.dottedLayer = dottedLayer;
    }
    
    self.dottedLayer.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    
    if (show) {
        self.dottedLayer.hidden = NO;
    } else {
        self.dottedLayer.hidden = YES;
    }
    
}

- (void)updateBottomChinHidden:(BOOL)isHidden{

    if (self.isMoveLocked || !self.isDrawView) {
        self.chin.hidden = YES;
        return;
    }
    
    [self setupDrawSubViewsIfNeeded];
    self.chin.hidden = isHidden;
    [self.chin.superview bringSubviewToFront:self.chin];
}

- (void)updateRightEarHidden:(BOOL)isHidden{
    if (self.isMoveLocked || !self.isDrawView) {
        self.rightEar.hidden = YES;
        return;
    }
    
    [self setupDrawSubViewsIfNeeded];
    self.rightEar.hidden = isHidden;
    [self.rightEar bringSubviewToFront:self.rightEar];
}

- (void)setupDrawSubViewsIfNeeded {
    if (!self.isDrawView) return;
    
    if (!self.rightEar) {
        UIImageView *ear = [UIImageView new];
        ear.contentMode = UIViewContentModeRight;
        ear.image = [UIImage imageNamed:@"5.水平缩放"];
        [self addSubview:ear];
        [ear mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kResizeThumbSize, kResizeThumbSize));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(kResizeThumbSize*0.1);
        }];
//        ear.backgroundColor = [UIColor lightGrayColor];
        self.rightEar = ear;
    }
    
    if (!self.chin) {
        UIImageView *chin = [UIImageView new];
        chin.contentMode = UIViewContentModeBottom;
        chin.image = [UIImage imageNamed:@"5.垂直缩放"];
        [self addSubview:chin];
        [chin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.size.equalTo(self.rightEar);
            make.bottom.equalTo(self).offset(kResizeThumbSize*0.1);
        }];
//        chin.backgroundColor = [UIColor lightGrayColor];
        self.chin = chin;
    }
}

- (void)setupAllGestureRecognizers {
    
    // 单击双击
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_singleTap:)];
    [self addGestureRecognizer:singleTap];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_doubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:doubleTap];
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    // 移动
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(_handlePan:)];
    [self addGestureRecognizer:pan];
}


#pragma mark - Private
- (void)_updateFrame:(CGRect)frame{
    [self setFrame:frame];
    [self updateDottedLayerShow:YES];
}

- (void)_singleTap:(UITapGestureRecognizer *)recognizer
{
    if (self.tap) {
        self.tap(DBTapType1);
    }
}

- (void)_doubleTap:(UITapGestureRecognizer *)recognizer
{
    if (self.tap) {
        self.tap(DBTapType2);
    }
}

- (void)_handlePan:(UIPanGestureRecognizer *)recognizer
{
    
    if (self.isMoveLocked) {
        return;
    }
    
    if (recognizer.state==UIGestureRecognizerStateBegan) {
        
        if (self.moveStart) {
            self.moveStart(self.frame);
        }
        
        self.startFrame = self.frame;
        
        self.touchStart = [recognizer locationInView:self];
        
        CGPoint locationInEar = [self.rightEar convertPoint:self.touchStart fromView:self];
        CGPoint locationInChin = [self.chin convertPoint:self.touchStart fromView:self];;
        
        self.isResizingR = CGRectContainsPoint(self.rightEar.bounds, locationInEar) && !self.rightEar.isHidden;
        self.isResizingD = CGRectContainsPoint(self.chin.bounds, locationInChin) && !self.chin.isHidden;
        
//        NSLog(@"----------\n earFrame:%@ chinFrame:%@\n touchStart:%@\n locationInEar:%@ locationInChin:%@ --------\n ",NSStringFromCGRect(self.rightEar.frame),NSStringFromCGRect(self.chin.frame),NSStringFromCGPoint(self.touchStart),NSStringFromCGPoint(locationInEar), NSStringFromCGPoint(locationInChin));
        
        
    } else if (recognizer.state==UIGestureRecognizerStateChanged) {
        
        NSLog(@"%@ %@",self,self.superview);
        CGPoint translation = [recognizer translationInView:self.superview];
//        CGPoint translation = [recognizer translationInView:self];
        
        NSLog(@"translation: %@", NSStringFromCGPoint(translation));
        CGFloat deltaWidth = translation.x;
        CGFloat deltaHeight = translation.y;
        
        CGFloat x = self.frame.origin.x;
        CGFloat y = self.frame.origin.y;
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        
        if (self.isResizingR) {
            deltaWidth = width+deltaWidth>kMinimumSize ? deltaWidth : 0;
//            self.frame = CGRectMake(x, y, width+deltaWidth, height);
            self.bounds = CGRectMake(0, 0, width+deltaWidth, height);
            self.center = CGPointMake(self.center.x+deltaWidth*0.5, self.center.y);
            
            if (self.sizeChange) {
                self.sizeChange(deltaWidth, 0);
            }
            
        } else if (self.isResizingD) {
            deltaHeight = height+deltaHeight>kMinimumSize ? deltaHeight : 0;
            self.frame = CGRectMake(x, y, width, deltaHeight+height);
            
            if (self.sizeChange) {
                self.sizeChange(0, deltaHeight);
            }
            
        } else {
            self.center = CGPointMake(self.center.x + translation.x,
                                      self.center.y + translation.y);
            
            if (self.pointChange) {
                self.pointChange(translation.x, translation.y);
            }
            
        }
        
        if (self.moveChange) {
            self.moveChange(translation);
        }
        
        [self updateDottedLayerShow:YES];
        
    } else if (recognizer.state==UIGestureRecognizerStateEnded) {
        if (self.moveEnd) {
            self.moveEnd(self.frame);
        }
    } else if (recognizer.state==UIGestureRecognizerStateFailed) {
        if (self.moveCanceled) {
            self.moveCanceled();
        }
    }
    
    // 重置偏移量
    [recognizer setTranslation:CGPointMake(0, 0) inView:self];

}

#pragma mark - Getter and  setter

- (void)setMoveChange:(DBMoveChangeBlock)dragHandleBlock {
    objc_setAssociatedObject(self, @selector(moveChange), dragHandleBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DBMoveChangeBlock)moveChange {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setMoveStart:(DBNormalBlock)startMove {
    objc_setAssociatedObject(self, @selector(moveStart), startMove, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DBNormalBlock)moveStart {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setMoveEnd:(DBNormalBlock)endMove {
    objc_setAssociatedObject(self, @selector(moveEnd), endMove, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DBNormalBlock)moveEnd {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTap:(DBTapBlock)tap {
    objc_setAssociatedObject(self, @selector(tap), tap, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DBTapBlock)tap {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setMoveCanceled:(DBNormalBlock)touchCanceled {
    objc_setAssociatedObject(self, @selector(moveCanceled), touchCanceled, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DBNormalBlock)moveCanceled {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setPointChange:(DBPointChangeBlock)pointChange {
    objc_setAssociatedObject(self, @selector(pointChange), pointChange, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DBPointChangeBlock)pointChange {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setSizeChange:(DBSizeChangeBlock)sizeChange {
    objc_setAssociatedObject(self, @selector(sizeChange), sizeChange, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DBSizeChangeBlock)sizeChange {
    return objc_getAssociatedObject(self, _cmd);
}


- (void)setDottedLayer:(CAShapeLayer *)dottedLayer {
    objc_setAssociatedObject(self, @selector(dottedLayer), dottedLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAShapeLayer *)dottedLayer {
   return objc_getAssociatedObject(self, _cmd);
}

- (void)setIsResizingR:(BOOL)isResizingR {
    objc_setAssociatedObject(self, @selector(isResizingR), [NSNumber numberWithBool:isResizingR], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isResizingR {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsResizingD:(BOOL)isResizingD {
    objc_setAssociatedObject(self, @selector(isResizingD), [NSNumber numberWithBool:isResizingD], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isResizingD {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setTouchStart:(CGPoint)touchStart {
    objc_setAssociatedObject(self, @selector(touchStart), [NSValue valueWithCGPoint:touchStart], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGPoint)touchStart {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (UIImageView *)rightEar {
    return  objc_getAssociatedObject(self, _cmd);
}

- (void)setRightEar:(UIImageView *)rightEar {
    objc_setAssociatedObject(self, @selector(rightEar), rightEar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImageView *)chin {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setChin:(UIImageView *)bottomChin {
    objc_setAssociatedObject(self, @selector(chin), bottomChin, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isDrawView {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsDrawView:(BOOL)isDrawView {
    objc_setAssociatedObject(self, @selector(isDrawView), [NSNumber numberWithBool:isDrawView], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isMoveLocked {
     return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsMoveLocked:(BOOL)isMoveLocked {
    objc_setAssociatedObject(self, @selector(isMoveLocked), [NSNumber numberWithBool:isMoveLocked], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setStartFrame:(CGRect)startFrame {
    objc_setAssociatedObject(self, @selector(startFrame), [NSValue valueWithCGRect:startFrame], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)startFrame {
    return [objc_getAssociatedObject(self, _cmd) CGRectValue];
}

@end
