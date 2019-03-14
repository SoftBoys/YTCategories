//
//  UIScrollView+YTMore.m
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/3/14.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import "UIScrollView+YTMore.h"
#import "CALayer+YTMore.h"

@implementation UIScrollView (YTMore)

- (UIImage *)snapshotLongImage {
    CGPoint contentOffset = self.contentOffset;
    CGRect scrollF = self.frame;
    self.contentOffset = CGPointZero;
    self.frame = (CGRect){0,0,self.contentSize};
    UIImage *image = [self.layer snapshotImage];
//    NSLog(@"image:%@", image);
    self.frame = scrollF;
    self.contentOffset = contentOffset;
    return image;
}

@end
