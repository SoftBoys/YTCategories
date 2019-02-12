//
//  NSTimer+YTMore.m
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/12.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import "NSTimer+YTMore.h"

@implementation NSTimer (YTMore)
+ (NSTimer *)yt_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    return [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(yt_timerBlock:) userInfo:block repeats:repeats];
}
+ (NSTimer *)yt_timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer * _Nonnull))block {
    return [NSTimer timerWithTimeInterval:interval target:self selector:@selector(yt_timerBlock:) userInfo:block repeats:repeats];
}
#pragma mark 定时器回调
+ (void)yt_timerBlock:(NSTimer *)timer {
    void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))timer.userInfo;
    if (block) {    
        block(timer);
    }
}
@end
