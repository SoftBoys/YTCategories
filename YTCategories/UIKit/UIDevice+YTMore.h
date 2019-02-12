//
//  UIDevice+YTMore.h
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/12.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (YTMore)

#pragma mark - Device Information

@property (nonatomic, assign, readonly) BOOL isPad;
@property (nonatomic, assign, readonly) BOOL isSimulator;
@property (nonatomic, assign, readonly) BOOL canMakePhoneCalls; // 是否可以打电话

/// The device's machine model.  e.g. "iPhone6,1" "iPad4,6"
/// @see http://theiphonewiki.com/wiki/Models
@property (nonatomic, copy, readonly) NSString *machineModel;
/// The device's machine model name. e.g. "iPhone 5s" "iPad mini 2"
@property (nonatomic, copy, readonly) NSString *machineModelName;

#pragma mark - Disk Space
/// Total disk space in byte. (-1 when error occurs)
@property (nonatomic, assign, readonly) int64_t diskSpace;
/// Free disk space in byte. (-1 when error occurs)
@property (nonatomic, assign, readonly) int64_t diskSpaceFree;
/// Used disk space in byte. (-1 when error occurs)
@property (nonatomic, assign, readonly) int64_t diskSpaceUsed;

@end

NS_ASSUME_NONNULL_END
