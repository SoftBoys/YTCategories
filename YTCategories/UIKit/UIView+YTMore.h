//
//  UIView+YTMore.h
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/14.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YTMore)

@property (nonatomic) CGFloat yt_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat yt_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat yt_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat yt_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat yt_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat yt_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat yt_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat yt_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint yt_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  yt_size;        ///< Shortcut for frame.size.
@property (nonatomic) CGFloat yt_originX;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat yt_originY;        ///< Shortcut for frame.origin.y.

@end

NS_ASSUME_NONNULL_END
