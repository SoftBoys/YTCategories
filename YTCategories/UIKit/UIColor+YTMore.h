//
//  UIColor+YTMore.h
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/12.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YTMore)
+ (UIColor *)yt_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)yt_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (UIColor *)yt_colorWithHexString:(NSString *)hexString;
@end

NS_ASSUME_NONNULL_END
