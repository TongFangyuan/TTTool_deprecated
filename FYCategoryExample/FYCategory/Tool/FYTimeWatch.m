//
//  FYTimeTestTool.m
//  FYCategoryExample
//
//  Created by admin on 2018/3/29.
//  Copyright © 2018年 IOS. All rights reserved.
//

#import "FYTimeWatch.h"

static FYTimeWatch *_instance = nil;

@interface FYTimeWatch()

@property (nonatomic,strong) NSString *recordName;
@property (nonatomic,strong) NSDate *begainDate;

@end

@implementation FYTimeWatch

// MARK: public
+ (void)startForEventName:(NSString *)name{
#ifdef DEBUG
    FYTimeWatch *watch=[FYTimeWatch shareInstance];
    watch.begainDate = [NSDate date];
    watch.recordName = name;
#endif
}

+ (NSTimeInterval)stop{
#ifdef DEBUG
    FYTimeWatch *watch=[FYTimeWatch shareInstance];
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:watch.begainDate];
    NSLog(@">>>>>>> [%@] took %f seconds",watch.recordName,timeInterval);
    return timeInterval;
#else
    return 0;
#endif
    
}

// MARK: private
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[[self class] alloc] init];
    });
    return _instance;
}

- (instancetype)init{
    if (self=[super init]) {
        _begainDate = [NSDate date];
    }
    return self;
}

@end
