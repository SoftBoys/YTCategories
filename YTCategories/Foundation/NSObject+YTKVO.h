//
//  NSObject+YTKVO.h
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/12.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YTKVO)

- (void)yt_addObserverBlockForKeyPath:(NSString *)keyPath block:(void(^)(id object, id oldVal, id newVal))block;

- (void)yt_removeObserverBlocksForKeyPath:(NSString *)keyPath;
- (void)yt_removeObserverBlocks;

@end

NS_ASSUME_NONNULL_END
