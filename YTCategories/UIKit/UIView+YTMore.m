//
//  UIView+YTMore.m
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/14.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import "UIView+YTMore.h"

@implementation UIView (YTMore)

- (CGFloat)yt_left {
    return self.frame.origin.x;
}

- (void)setYt_left:(CGFloat)yt_left {
    CGRect frame = self.frame;
    frame.origin.x = yt_left;
    self.frame = frame;
}

- (CGFloat)yt_top {
    return self.frame.origin.y;
}

- (void)setYt_top:(CGFloat)yt_top {
    CGRect frame = self.frame;
    frame.origin.y = yt_top;
    self.frame = frame;
}

- (CGFloat)yt_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setYt_right:(CGFloat)yt_right {
    CGRect frame = self.frame;
    frame.origin.x = yt_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)yt_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setYt_bottom:(CGFloat)yt_bottom {
    CGRect frame = self.frame;
    frame.origin.y = yt_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)yt_width {
    return self.frame.size.width;
}

- (void)setYt_width:(CGFloat)yt_width {
    CGRect frame = self.frame;
    frame.size.width = yt_width;
    self.frame = frame;
}

- (CGFloat)yt_height {
    return self.frame.size.height;
}

- (void)setYt_height:(CGFloat)yt_height {
    CGRect frame = self.frame;
    frame.size.height = yt_height;
    self.frame = frame;
}

- (CGFloat)yt_centerX {
    return self.center.x;
}

- (void)setYt_centerX:(CGFloat)yt_centerX {
    CGPoint center = self.center;
    center.x = yt_centerX;
    self.center = center;
}

- (CGFloat)yt_centerY {
    return self.center.y;
}

- (void)setYt_centerY:(CGFloat)yt_centerY {
    CGPoint center = self.center;
    center.y = yt_centerY;
    self.center = center;
}

- (CGPoint)yt_origin {
    return self.frame.origin;
}

- (void)setYt_origin:(CGPoint)yt_origin {
    CGRect frame = self.frame;
    frame.origin = yt_origin;
    self.frame = frame;
}

- (CGSize)yt_size {
    return self.frame.size;
}

- (void)setYt_size:(CGSize)yt_size {
    CGRect frame = self.frame;
    frame.size = yt_size;
    self.frame = frame;
}

- (CGFloat)yt_originX {
    return self.frame.origin.x;
}

- (void)setYt_originX:(CGFloat)yt_originX {
    CGRect newFrame   = self.frame;
    newFrame.origin.x = yt_originX;
    self.frame        = newFrame;
}

- (CGFloat)yt_originY {
    return self.frame.origin.y;
}

- (void)setYt_originY:(CGFloat)yt_originY {
    CGRect newFrame   = self.frame;
    newFrame.origin.y = yt_originY;
    self.frame        = newFrame;
}

@end
