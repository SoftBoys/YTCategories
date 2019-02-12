//
//  UIControl+YTMore.h
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/12.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (YTMore)

- (void)yt_setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
- (void)yt_setBlockForControlEvents:(UIControlEvents)controlEvents block:(void(^)(void))block;
- (void)yt_addBlockForControlEvents:(UIControlEvents)controlEvents block:(void(^)(void))block;

- (void)yt_removeAllBlocksForControlEvents:(UIControlEvents)controlEvents;
- (void)yt_removeAllTargets;
@end

NS_ASSUME_NONNULL_END
