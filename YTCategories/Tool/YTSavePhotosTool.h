//
//  YTSavePhotosTool.h
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/3/14.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YTSavePhotosTool : NSObject
+ (void)writeToPhotosAlbumWithImage:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
