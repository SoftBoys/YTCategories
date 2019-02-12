//
//  UIImage+YTMore.h
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/12.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YTMore)
/** 返回一张圆图片 */
- (UIImage *)yt_circleImage;
/** 返回一个带圆角的图片 */
- (UIImage *)yt_imageWithCornerRadius:(CGFloat)cornerRadius;
/** 返回一个带圆角,边框的图片 */
- (UIImage *)yt_imageWithCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
/** 返回一个带圆角,边框的图片 */
- (UIImage *)yt_imageWithCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor rectCorner:(UIRectCorner)rectCorner;
/** 返回一张重置大小的图片 */
- (UIImage *)yt_imageByResizeToSize:(CGSize)size;

/** 设置一张纯色的图片 */
+ (UIImage *)yt_imageWithColor:(UIColor *)color;
+ (UIImage *)yt_imageWithColor:(UIColor *)color size:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
